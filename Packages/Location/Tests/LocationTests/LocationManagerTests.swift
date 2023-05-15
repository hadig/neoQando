import XCTest
import CoreLocation
@testable import Location

final class LocationManagerTests: XCTestCase {
    private let floridsdorf = CLLocationCoordinate2D(latitude: 48.25656811286712,
                                                     longitude: 16.39960820538492)

    func testLocationAccuracy() throws {
        let locationManager = LocationManager()
        XCTAssertEqual(locationManager.locationFetcher.desiredAccuracy, kCLLocationAccuracyBest)
    }

    func testLocationDelegateIsNotNil() throws {
        let locationManager = LocationManager()
        XCTAssertNotNil(locationManager.locationFetcher.locationFetcherDelegate)
    }

    func testCurrentLocation() throws {
        var locationFetcher = MockLocationFetcher()
        let requestLocationExpectation = expectation(description: "request location")
        locationFetcher.handleRequestLocation = {
            requestLocationExpectation.fulfill()
            return CLLocation(latitude: self.floridsdorf.latitude,
                              longitude: self.floridsdorf.longitude)
        }

        let locationManager = LocationManager(locationFetcher: locationFetcher)
        locationManager.checkCurrentLocation()

        XCTAssertEqual(locationManager.currentLocation?.coordinate.latitude, floridsdorf.latitude)
        XCTAssertEqual(locationManager.currentLocation?.coordinate.longitude, floridsdorf.longitude)

        wait(for: [requestLocationExpectation], timeout: 1)
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
}
