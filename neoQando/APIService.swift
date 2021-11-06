//
//  APIService.swift
//  neoQando
//
//  Created by Hadi G. on 30.10.21.
//
import Foundation

class APIService {
    static let shared = APIService()
    enum APIError: Error {
        case invalidURL
        case badID
        case badResponse
    }
    
    func getJSON<T: Decodable>(urlString: String) async throws -> T {
                                    
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        let response = try decoder.decode(T.self, from: data)
        return response
    }
    
    
}
