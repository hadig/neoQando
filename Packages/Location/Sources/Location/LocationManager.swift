import CoreLocation

class LocationManager: NSObject {

    var locationFetcher: LocationFetcher
    var currentLocation: CLLocation?

    init(locationFetcher: LocationFetcher = CLLocationManager()) {
        self.locationFetcher = locationFetcher
        super.init()
        setUp()
    }

    private func setUp() {
        self.locationFetcher.locationFetcherDelegate = self
        self.locationFetcher.allowsBackgroundLocationUpdates = false
        self.locationFetcher.desiredAccuracy = kCLLocationAccuracyBest
        self.locationFetcher.activityType = .otherNavigation
    }
}

// MARK: Public methods
extension LocationManager {
    public func checkCurrentLocation() {
        locationFetcher.requestLocation()
    }
}

// MARK: Delegate
extension LocationManager: LocationFetcherDelegate {

    func locationFetcher(_ fetcher: LocationFetcher, didUpdateLocations locations: [CLLocation]) {
        guard let lastLocation = locations.last else {
            return
        }
        currentLocation = lastLocation
    }

    func locationFetcher(_ fetcher: LocationFetcher, didFailWithError error: Error) {
        return
    }

    func locationFetcherDidChangeAuthorization(_ fetcher: LocationFetcher) {
        switch fetcher.authorizationStatus {
        case .notDetermined:
            fetcher.requestWhenInUseAuthorization()
            break

        case .restricted, .denied:
            break

        case .authorizedAlways, .authorizedWhenInUse:
            // we could check for the location accuracy here
            switch fetcher.accuracyAuthorization {

            case .fullAccuracy:
                // app would work best with full accuracy
                break

            case .reducedAccuracy:
                // maybe let user know that:
                // The accuracy of location data is reduced in both space and time
                // using approaches like selecting a nearby point of interest and updating
                // the location at most a few times per hour. The approximate location
                // preserves the user’s country or region, typically preserves the city,
                // and is usually within 1–20 kilometers of the actual location.
                // https://developer.apple.com/documentation/corelocation/kcllocationaccuracyreduced
                break

            @unknown default:
                break
            }
            break

        @unknown default:
            break
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.locationFetcher(manager, didUpdateLocations: locations)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.locationFetcher(manager, didFailWithError: error)
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        self.locationFetcherDidChangeAuthorization(manager)
    }
}
