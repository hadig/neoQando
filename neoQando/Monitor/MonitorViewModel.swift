//
//  MonitorViewModel.swift
//  neoQando
//
//  Created by Hadi G. on 04.11.21.
//

import Foundation

struct MonitorViewModel: Identifiable {
    let monitor: RealTime.Data.Monitor
    init(monitor: RealTime.Data.Monitor) {
        self.monitor = monitor
    }
    
    let id = UUID()
    
    var locationStop: String {
        monitor.locationStop.properties?.title ?? "Unavailable"
    }
    
    var lines: [Line] {
        var output: [Line] = []
        for line in monitor.lines {
            let line: Line = Line(line: line)
            output.append(line)
        }
        return output
    }
    
    var coordinates: [Double] {
        monitor.locationStop.geometry?.coordinates ?? [0]
    }
}
