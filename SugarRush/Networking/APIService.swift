//
//  APIService.swift
//  SugarRush
//
//  Created by Mohammed Jameeluddin on 9/7/23.
//

import Foundation

struct APIService: APIServiceProtocol {
    func fetchData<T: Codable>(using string: String, for type: T.Type) async throws -> T {
        guard let url = URL(string: string) else {
            throw APIError.invalidURL
        }
        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
            let statusCode = (response as! HTTPURLResponse).statusCode
            throw APIError.invalidResponse
        }
        let fetchedData:T = try JSONDecoder().decode(T.self, from: data)
        return fetchedData
    }
}

