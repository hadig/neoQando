import XCTest
import CoreLocation
@testable import Location

final class LocationManagerTests: XCTestCase {
    @available(iOS 16.4, *)
    func testRequestLocation() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCUIDevice.shared.location = XCUILocation(location: CLLocation(latitude: 4, longitude: 20))
        let locationManager = LocationManager()
        locationManager.locationManager.requestLocation()

        XCTAssertEqual(locationManager.location, CLLocation(latitude: 4, longitude: 20))
    }
}
