//
//  RealTimeViewModel.swift
//  neoQando
//
//  Created by Hadi G. on 31.10.21.
//

import Foundation

class RealTimeViewModel: ObservableObject {
    @Published var data: [RealTime.Data.Monitor] = []
    
    func getData() {
        
        Task {
            
            do {
                let endPoint = Constants.generateBaseURL(with: 60200489)
                print(endPoint)
                let response: RealTime = try await APIService.shared.getJSON(urlString: endPoint)
                
                DispatchQueue.main.async {
                    
                    self.data = response.data.monitors
                    
                }
                
            } catch {
                print("Request failed with error: \(error)")
            }
            
        }
    }
}
