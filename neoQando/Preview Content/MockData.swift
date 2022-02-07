//
//  MockData.swift
//  neoQando
//
//  Created by Hadi G. on 06.02.22.
//

import Foundation

extension RealTime.Data.Monitor {
    static var mockData: [RealTime.Data.Monitor] {
        Bundle.main.decode([RealTime.Data.Monitor].self, from: "realTime.json")
    }
    static var mockSingleMonitor: RealTime.Data.Monitor {
        Self.mockData[0]
    }
}
