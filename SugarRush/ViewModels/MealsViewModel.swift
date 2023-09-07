//
//  MealsViewModel.swift
//  SugarRush
//
//  Created by Mohammed Jameeluddin on 9/7/23.
//

import Foundation

class MealsViewModel: ObservableObject {
    
    static let shared = NetworkManager()
   @Published var fetchedMeals: [Meal] = []
    let baseURL = Constants.URL.mealBaseURL
    var id: String!
  

     func fetchMealsData(using id: String) {
        let url = "\(baseURL)\(id)"
        Task {
            do {
                let data =  try await MealsViewModel.shared.service.fetchData(using: url, for: Meals.self)
               Task { @MainActor in
                    self.fetchedMeals = data.meals
                }
            } catch {
                throw APIError.invalidData
            }
        }
    }
}
