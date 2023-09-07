//
//  NetworkManager.swift
//  SugarRush
//
//  Created by Mohammed Jameeluddin on 9/7/23.
//

import SwiftUI

class NetworkManager: ObservableObject {
    
    static let shared = NetworkManager()
    let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
    }
}
