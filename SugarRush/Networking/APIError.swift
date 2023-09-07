//
//  APIError.swift
//  SugarRush
//
//  Created by Mohammed Jameeluddin on 9/7/23.
//

import Foundation

enum APIError: String, Error {
    case invalidURL = "This is an invalid URL"
    case invalidResponse = "Failed to retrive response, please try again"
    case invalidStatusCode = "Network Unavailable"
    case invalidData = "Unable to decode data"
}
