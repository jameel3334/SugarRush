//
//  MealsViewModel.swift
//  SugarRush
//
//  Created by Mohammed Jameeluddin on 9/7/23.
//

import Foundation

class MealsViewModel: ObservableObject {
    
    @Published var fetchedMeals: [Meal] = []
    let baseURL = Constants.Url.mealBaseURL
    
    func fetchMealsData(using id: String) async throws {
        let url = "\(baseURL)\(id)"
        do {
            let data =  try await NetworkManager.shared.service.fetchData(using: url, for: Meals.self)
            Task { @MainActor in
                self.fetchedMeals = data.meals
            }
        } catch {
            throw APIError.invalidData
        }
    }
}
