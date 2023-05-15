//
//  LocationFetcher.swift
//  Used to mock CLLocationManager
//
//  Created by Hadi G. on 15.05.23.
//

import CoreLocation

protocol LocationFetcher {
    var locationFetcherDelegate: LocationFetcherDelegate? { get set }
    var allowsBackgroundLocationUpdates: Bool { get set }
    var desiredAccuracy: CLLocationAccuracy { get set }
    var activityType: CLActivityType { get set }
    var authorizationStatus: CLAuthorizationStatus { get }
    var accuracyAuthorization: CLAccuracyAuthorization { get }

    func requestWhenInUseAuthorization()
    func requestLocation()
}

protocol LocationFetcherDelegate: AnyObject {
    func locationFetcher(_ fetcher: LocationFetcher, didUpdateLocations locations: [CLLocation])
    func locationFetcher(_ fetcher: LocationFetcher, didFailWithError error: Error)
    func locationFetcherDidChangeAuthorization(_ fetcher: LocationFetcher)
}

extension CLLocationManager: LocationFetcher {
    var locationFetcherDelegate: LocationFetcherDelegate? {
        get {
            delegate as! LocationFetcherDelegate?
        }
        set {
            delegate = newValue as! CLLocationManagerDelegate?
        }
    }
}
