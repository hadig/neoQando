import CoreLocation

class LocationManager: NSObject {

    var locationManager = CLLocationManager()
    var location = CLLocation()

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.allowsBackgroundLocationUpdates = false
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.activityType = .otherNavigation
    }
}

extension LocationManager: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let lastLocation = locations.last else {
            return
        }
        location = lastLocation
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        return
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
            break

        case .restricted, .denied:
            break

        case .authorizedAlways, .authorizedWhenInUse:
            // we could check for the location accuracy here
            switch manager.accuracyAuthorization {

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
