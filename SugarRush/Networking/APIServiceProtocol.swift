//
//  APIServiceProtocol.swift
//  SugarRush
//
//  Created by Mohammed Jameeluddin on 9/7/23.
//

import Foundation

protocol APIServiceProtocol {
    func fetchData<T: Codable>(using string: String, for type: T.Type) async throws -> T
}
