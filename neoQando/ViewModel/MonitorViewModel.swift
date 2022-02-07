//
//  MonitorViewModel.swift
//  neoQando
//
//  Created by Hadi G. on 31.10.21.
//

import Foundation

class MonitorViewModel: ObservableObject {
    @Published var monitor: [RealTime.Data.Monitor] = []
    
    func getData() {
        let endPoint = Constants.generateBaseURL(with: 60200334)
        let apiService = APIService(urlString: endPoint)
        print(endPoint)
        apiService.getJSON { (result: Result<RealTime, APIError>) in
            switch result {
            case .success(let monitor):
                DispatchQueue.main.async {
                    self.monitor = monitor.data.monitors
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

extension MonitorViewModel {
    convenience init(forPreview: Bool = false) {
        self.init()
        if forPreview {
            self.monitor = RealTime.Data.Monitor.mockData
        }
    }
}
