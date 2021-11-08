//
//  Line.swift
//  neoQando
//
//  Created by Hadi G. on 06.11.21.
//

import Foundation

struct Line {
    let line: RealTime.Data.Monitor.Line
    init(line: RealTime.Data.Monitor.Line){
        self.line = line
    }
    
    var name: String {
        line.name ?? ""
    }
    
    var barrierFree: Bool {
        line.barrierFree ?? false
    }
    
    var realtimeSupported: Bool {
        line.realtimeSupported ?? false
    }
    
    var departures: [Departure] {
        var output: [Departure] = []
        if let deps = line.departures, let dep = deps.departure {
            for departures in dep {
                let departure: Departure = Departure(departure: departures)
                output.append(departure)
            }
        }
        return output
    }
    
    var trafficjam: Bool {
        line.trafficjam ?? false
    }
    
    var towards: String {
        line.towards ?? ""
    }
}
