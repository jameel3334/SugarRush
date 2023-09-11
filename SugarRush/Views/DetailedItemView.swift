//
//  DetailedComponentView.swift
//  SugarRush
//
//  Created by Mohammed Jameeluddin on 9/10/23.
//

import SwiftUI

struct DetailedItemView: View {
    
    @ObservedObject var viewModel = MealsViewModel()
    @State private var ingredientsIsShowing = false
    @State private var isFavorite           = false
    @State private var mealAlertIsShowing   = false
    var id: String
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.fetchedMeals, id: \.id) { meal in
                VStack {
                    ImageView(imageURL: meal.imageURL)
                        .overlay(
                            HeaderTextView(text: meal.title,
                                           multiTextAlignment: .leading,
                                           color: .white)
                            .shadow(color: .black, radius: 1)
                            .offset(y: 170)
                            .padding()
                        )
                    Divider()
                    IngredientsView(text: meal.ingredientsAndMeasures)
                        .padding()
                    Divider()
                    InstructionsView(text: meal.instructions)
                        .padding()
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .task {
            do {
                try await viewModel.fetchMealsData(using: id)
            } catch {
                mealAlertIsShowing = true
            }
        }
        .alert(isPresented: $mealAlertIsShowing) {
            Alert(
                title: Text(Constants.String.alertTitle),
                message: Text(Constants.String.alertMessage),
                dismissButton: .default(Text("OK"))
            )}
    }
}


struct DetailedComponentView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedItemView(id: "52855")
    }
}
