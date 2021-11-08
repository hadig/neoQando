//
//  Departure.swift
//  neoQando
//
//  Created by Hadi G. on 06.11.21.
//

import Foundation

struct Departure {
    let departure: RealTime.Data.Monitor.Line.Departure.Departure
    init(departure: RealTime.Data.Monitor.Line.Departure.Departure) {
        self.departure = departure
    }
    
    var timePlanned: Date {
        departure.departureTime?.timePlanned ?? Date()
    }
    
    var timeReal: Date {
        departure.departureTime?.timeReal ?? Date()
    }
    
    var countdown: Int {
        departure.departureTime?.countdown ?? 0
    }
    
}
