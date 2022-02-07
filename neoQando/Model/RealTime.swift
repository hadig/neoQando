//
//  RealTime.swift
//  neoQando
//
//  Created by Hadi G. on 30.10.21.
//
import Foundation

struct RealTime: Decodable {
    struct Data: Decodable {
        struct Monitor: Decodable, Identifiable {
            struct LocationStop: Decodable {
                struct Geometry: Decodable {
                    let type: String
                    let coordinates: [Double]
                }
                
                struct Property: Decodable {
                    struct Attribute: Decodable {
                        let rbl: Int
                    }
                    
                    let name: String
                    let title: String
                    let municipality: String
                    let municipalityId: Int
                    let type: String
                    let coordName: String
                    let gate: String?
                    let attributes: Attribute
                }
                
                let type: String
                let geometry: Geometry
                let properties: Property
            }
            
            struct Line: Decodable, Identifiable {
                struct Departure: Decodable {
                    struct Departures: Decodable, Identifiable {
                        struct DepartureTime: Decodable {
                            let timePlanned: Date?
                            let timeReal: Date?
                            let countdown: Int?
                        }
                        
                        struct Vehicle: Decodable {
                            struct Attribute: Decodable {
                            }
                            
                            let name: String
                            let towards: String
                            let direction: String
                            let richtungsId: String
                            let barrierFree: Bool
                            let realtimeSupported: Bool
                            let trafficjam: Bool
                            let type: String
                            let attributes: Attribute
                            let linienId: Int
                        }
                        
                        let id = UUID()
                        let departureTime: DepartureTime
                        let vehicle: Vehicle?
                        
                        private enum CodingKeys: String, CodingKey { case departureTime, vehicle }
                    }
                    
                    let departure: [Departures]
                }
                
                let id = UUID()
                let name: String
                let towards: String
                let direction: String
                let platform: String
                let richtungsId: String
                let barrierFree: Bool
                let realtimeSupported: Bool
                let trafficjam: Bool
                let departures: Departure
                let type: String
                let lineId: Int
                
                private enum CodingKeys: String, CodingKey
                { case name, towards, direction, platform, richtungsId, barrierFree, realtimeSupported, trafficjam, departures, type, lineId }
            }
            
            struct Attribute: Decodable {
            }
            
            let id = UUID()
            let locationStop: LocationStop
            let lines: [Line]
            let attributes: Attribute
            
            private enum CodingKeys: String, CodingKey { case locationStop, lines, attributes }
        }
        
        let monitors: [Monitor]
    }
    
    struct Message: Decodable {
        let value: String
        let messageCode: Int
        let serverTime: Date
    }
    
    let data: Data
    let message: Message
}
