//
//  DessertsViewModel.swift
//  SugarRush
//
//  Created by Mohammed Jameeluddin on 9/7/23.
//

import SwiftUI

class DessertsViewModel: ObservableObject {
    
    @Published var desserts: [Dessert] = []
    private let dessertsKey = "Desserts"
    
    init() {
        loadFavorites()
    }
    
    func fetchDessertData() async throws {
        let url = Constants.Url.dessertsURL
            do {
                let data = try await NetworkManager.shared.service.fetchData(using: url, for: Desserts.self)
                Task { @MainActor in
                    self.desserts = data.desserts
                    saveFetchedData()
                }
            } catch {
                throw APIError.invalidData
            }
        }
    
    private func saveFetchedData() {
        do {
            let data = try JSONEncoder().encode(desserts)
            UserDefaults.standard.set(data, forKey: dessertsKey)
        } catch {
            print("Error encoding favorites: \(error)")
        }
    }
    private func loadFavorites() {
        if let data = UserDefaults.standard.data(forKey: dessertsKey) {
            do {
                desserts = try JSONDecoder().decode([Dessert].self, from: data)
            } catch {
                print("Error decoding favorites: \(error)")
            }
        }
    }
}

