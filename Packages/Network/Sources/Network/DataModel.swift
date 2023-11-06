//
//  DataModel.swift
//  
//
//  Created by Hadi G. on 27.05.23.
//

import Foundation

struct RealTime: Decodable {
    let data: Data?
    let trafficInfos: [TrafficInfo]?
    let trafficInfoCategories: [TrafficInfoCategory]?
    let trafficInfoCategoryGroups: [TrafficInfoCategoryGroup]?
    let message: Message

    struct Data: Decodable {
        let monitors: [Monitor]

        struct Monitor: Decodable {
            let locationStop: LocationStop
            let lines: [Line]?
            let refTrafficInfoNames: [String]?
            let attributes: Attribute?

            struct LocationStop: Decodable {
                let type: String
                let geometry: Geometry
                let properties: Property

                struct Geometry: Decodable {
                    let type: String
                    let coordinates: [Double]
                }

                struct Property: Decodable {
                    let name: String
                    let title: String
                    let municipality: String
                    let municipalityId: Int
                    let type: String
                    let coordName: String
                    let gate: String?
                    let attributes: Attribute

                    struct Attribute: Decodable {
                        let rbl: Int
                    }
                }
            }

            struct Line: Decodable {
                let name: String
                let towards: String
                let direction: String
                let platform: String?
                let richtungsId: String
                let barrierFree: Bool?
                let realtimeSupported: Bool?
                let trafficjam: Bool?
                let departures: Departure
                let type: String
                let lineId: Int?

                struct Departure: Decodable {
                    let departure: [Departures]?

                    struct Departures: Decodable {
                        let departureTime: DepartureTime
                        let vehicle: Vehicle?

                        struct DepartureTime: Decodable {
                            let timePlanned: Date
                            let timeReal: Date?
                            let countdown: Int
                        }

                        struct Vehicle: Decodable {
                            let name: String
                            let towards: String
                            let direction: String
                            let platform: String?
                            let richtungsId: String
                            let barrierFree: Bool
                            let foldingRamp: Bool?
                            let foldingRampType: String?
                            let realtimeSupported: Bool
                            let trafficjam: Bool
                            let type: String
                            let attributes: Attribute?
                            let linienId: Int

                            struct Attribute: Decodable { }
                        }
                    }
                }
            }

            struct Attribute: Decodable { }
        }
    }

    struct TrafficInfo: Decodable {
        let refTrafficInfoCategoryId: Int
        let name: String
        let priority: String?
        let owner: String?
        let title: String
        let description: String
        let time: Time?
        let relatedLines: [String]?
        let relatedStops: [Int]?
        let attributes: Attribute?

        struct Time: Decodable {
            let start: Date?
            let end: Date?
            let resume: Date?
        }

        struct Attribute: Decodable {
            let status: String?
            let station: String?
            let location: String?
            let reason: String?
            let towards: String?
            let relatedLines: [String]?
            let relatedStops: [String]?
        }
    }

    struct TrafficInfoCategory: Decodable {
        let id: Int
        let refTrafficInfoCategoryGroupId: Int
        let name: String
        let trafficInfoNameList: String
        let title: String
    }

    struct TrafficInfoCategoryGroup: Decodable {
        let id: Int
        let name: String
    }

    struct Message: Decodable {
        let value: String
        let messageCode: Int
        let serverTime: Date
    }
}
