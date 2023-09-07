//
//  DessertsViewModel.swift
//  SugarRush
//
//  Created by Mohammed Jameeluddin on 9/7/23.
//

import Foundation


class DessertsViewModel: ObservableObject {
    
    @Published var fetchedDesserts: [Dessert] = []
    
    func fetchDessertData() {
        let url = Constants.Url.dessertsURL
        Task {
            do {
                let data = try await NetworkManager.shared.service.fetchData(using: url, for: Desserts.self)
                Task { @MainActor in
                    self.fetchedDesserts = data.desserts
                }
            } catch {
                throw APIError.invalidData
            }
        }
    }
}
