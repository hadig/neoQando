//
//  RealTime.swift
//  neoQando
//
//  Created by Hadi G. on 30.10.21.
//

import Foundation

struct RealTime: Decodable {
  struct Data: Decodable {
    struct Monitor: Decodable {
      struct Line: Decodable {
        struct Departure: Decodable {
          struct Departure: Decodable {
            struct DepartureTime: Decodable {
              let countdown: Int?
              let timePlanned: Date?
              let timeReal: Date?
            }

            let departureTime: DepartureTime?
          }

          let departure: [Departure]?
        }

        let barrierFree: Bool?
        let departures: Departure?
        let direction: String? //(‚H’ – hin oder ‚R’- retour)
        let lineId: Int?
        let name: String?
        let platform: String?
        let realtimeSupported: Bool?
        let richtungsId: String?
        let towards: String?
        let trafficjam: Bool?
        let type: String?
      }

      struct LocationStop: Decodable {
        struct Geometry: Decodable {
          let coordinates: [Double]?
          let type: String?
        }

        struct Property: Decodable {
          let municipality: String?
          let name: String? //diva
          let title: String?
          let type: String?
        }

        let geometry: Geometry?
        let properties: Property?
        let type: String?
      }

      let lines: [Line]
      let locationStop: LocationStop
    }

    let monitors: [Monitor]
  }

  struct Message: Decodable {
    let messageCode: Int
    let serverTime: Date
    let value: String
  }

  let data: Data
  let message: Message
}
