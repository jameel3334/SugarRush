//
//  MealsView.swift
//  SugarRush
//
//  Created by Mohammed Jameeluddin on 9/7/23.
//

import SwiftUI

struct MealDetailView: View {
    @ObservedObject var viewModel = MealsViewModel()
    @State private var ingredientsIsShowing: Bool = false
    @State private var isFavorite = false
    var id: String
    var body: some View {
        ZStack {
            Color(Constants.Color.accentColor).opacity(Constants.General.opacityBackground)
                .ignoresSafeArea()
            ScrollView {
                ForEach(viewModel.fetchedMeals, id: \.id) { meal in
                    VStack {
                        DetailedImageView(imageURL: meal.image)
                            .frame(width: Constants.Image.portraitViewImageDimensions, height: Constants.Image.portraitViewImageDimensions)
                        Divider()
                        HeaderTextView(text: meal.title,
                                      multiTextAlignment: .trailing,
                                      horizontalFixedSize: false,
                                      verticalFixedSize: true)
                        .padding()
                        Spacer()
                        InfoButton(ingredientsIsShowing: $ingredientsIsShowing)
                        Spacer()
                        Divider()
                        HeaderTextView(text: Constants.String.instructionTitle,
                                      multiTextAlignment: .center)
                        .padding()
                        BodyTextView(text: meal.instructions,
                                  multiTextAlignment: .center,
                                  horizontalFixedSize: false,
                                  verticalFixedSize: true)
                        .padding()
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            AddToFavorite(isFavorite: $isFavorite, meal: meal)
                        }
                    }
                    .sheet(isPresented: $ingredientsIsShowing) {
                        IngredientsView(ingredientsAndMeasures: meal.ingredientsAndMeasures)
                    }
                }
            }
            .task { viewModel.fetchMealsData(using: id) }
        }
    }
}

struct InfoButton: View {
    @Binding var ingredientsIsShowing: Bool
    var body: some View {
            Button(action: {
                ingredientsIsShowing = true
            }) {
                HStack(spacing: nil){
                    BodyTextView(text: Constants.String.tapForIngredients,
                              multiTextAlignment: .trailing)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    Image(systemName: "info.circle")
                }
                .padding(.horizontal, Constants.General.constraintsTopBottom)
            }
    }
}

struct AddToFavorite: View {
    @EnvironmentObject var viewModel: FavoritesViewModel
    @Binding var isFavorite: Bool
    var meal: Meal
    var body: some View {
        Button(action:  {
            self.isFavorite.toggle()
            if self.isFavorite {
                self.viewModel.add(addedItem: meal)
            } else {
                self.viewModel.undo(addedItem: meal)
            }
        }) {
            Image(systemName: isFavorite ? "heart.fill" : "heart")
                .foregroundColor(isFavorite ? .red : .gray)
        }
        .padding(.vertical, 10)
    }
}

