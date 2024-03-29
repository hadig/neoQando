//
//  LocationStops.swift
//  
//
//  Created by Hadi G. on 18.05.23.
//

import CoreLocation
import Foundation

enum LocationStop {

    static func parseLocationStops() -> [Stop] {
        parseJSON(from: getJSON())
    }

    private static func getJSON() -> Data? {
        guard let path = Bundle.module.url(forResource: "Haltepunkte", withExtension: "json") else {
            fatalError("Failed to locate resource")
        }

        do {
            let data = try Data(contentsOf: path)
            return data
        } catch {
            print("💥 Boom: \(error)")
        }
        
        return nil
    }

    private static func parseJSON(from data: Data?) -> [Stop] {
        guard let data else {
            fatalError("Failed to load iput data")
        }

        do {
            let stopsData = try JSONDecoder().decode([Stop].self, from: data)
            return stopsData
        } catch {
            print("💥 Boom: \(error)")
        }

        return []
    }
}

struct Stop: Decodable {
    let stopId: Int
    let diva: Int
    let stopText: String
    let municipality: String
    let municipalityId: Int
    let longitude: CLLocationDegrees
    let latitude: CLLocationDegrees

    enum CodingKeys: String, CodingKey {
        case stopId = "StopID"
        case diva = "DIVA"
        case stopText = "StopText"
        case municipality = "Municipality"
        case municipalityId = "MunicipalityID"
        case longitude = "Longitude"
        case latitude = "Latitude"
    }
}

extension Stop {
    var location: CLLocation {
        CLLocation(latitude: latitude, longitude: longitude)
    }
}
