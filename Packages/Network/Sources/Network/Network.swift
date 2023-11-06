//
//  File.swift
//  
//
//  Created by Hadi G. on 27.05.23.
//

import Foundation

public enum APIService {

    public static func getJSON<T: Decodable>(urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw APIError.dataNotFound
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)

        guard let decodedData =  try? decoder.decode(T.self, from: data) else {
            throw APIError.decodingError
        }
        
        return decodedData
    }
}

private var dateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    return formatter
}

private enum APIError: LocalizedError {
    case invalidURL
    case dataNotFound
    case decodingError
}
