//
//  Constants.swift
//  neoQando
//
//  Created by Hadi G. on 27.10.21.
//

import Foundation

enum Constants {
    static let baseURLrealTime = "https://www.wienerlinien.at/ogd_realtime/"
    
    static func generateBaseURL(with diva: Int) -> String {
         Self.baseURLrealTime + "monitor?diva=" + String(diva)
    }
}
