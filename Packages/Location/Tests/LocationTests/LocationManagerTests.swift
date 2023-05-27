import XCTest
import CoreLocation
@testable import Location

final class LocationManagerTests: XCTestCase {
    let floridsdorf = CLLocationCoordinate2D(latitude: 48.25656811286712,
                                             longitude: 16.39960820538492)
    var locationManager = LocationManager()

    override func setUpWithError() throws {
        var locationFetcher = MockLocationFetcher()
        locationFetcher.handleRequestLocation = {
            CLLocation(latitude: self.floridsdorf.latitude,
                       longitude: self.floridsdorf.longitude)
        }

        locationManager = LocationManager(locationFetcher: locationFetcher)
    }

    func testLocationAccuracy() throws {
        XCTAssertEqual(locationManager.locationFetcher.desiredAccuracy, kCLLocationAccuracyBest)
    }

    func testLocationDelegateIsNotNil() throws {
        XCTAssertNotNil(locationManager.locationFetcher.locationFetcherDelegate)
    }

    func testCurrentLocation() throws {
        locationManager.checkCurrentLocation()

        XCTAssertEqual(locationManager.currentLocation?.coordinate.latitude, floridsdorf.latitude)
        XCTAssertEqual(locationManager.currentLocation?.coordinate.longitude, floridsdorf.longitude)
    }

    func testLocationStops() throws {
        XCTAssertNotNil(locationManager.locationStops)
        XCTAssertFalse(locationManager.locationStops.isEmpty)
    }

    func testLocationStopsNearMe() throws {
        locationManager.checkCurrentLocation()

        let stopsNearMe = locationManager.findStopsNearMe(within: 500)
        XCTAssertFalse(stopsNearMe.isEmpty)
        print(stopsNearMe)
    }

}

struct MockLocationFetcher: LocationFetcher {

    weak var locationFetcherDelegate: LocationFetcherDelegate?

    var allowsBackgroundLocationUpdates: Bool = false

    var desiredAccuracy: CLLocationAccuracy = kCLLocationAccuracyBest

    var activityType: CLActivityType = .otherNavigation

    var authorizationStatus: CLAuthorizationStatus = .authorizedWhenInUse

    var accuracyAuthorization: CLAccuracyAuthorization = .fullAccuracy

    func requestWhenInUseAuthorization() {
        return
    }

    var handleRequestLocation: (() -> CLLocation)?
    func requestLocation() {
        guard let location = handleRequestLocation?() else { return }
        locationFetcherDelegate?.locationFetcher(self, didUpdateLocations: [location])
    }
}
