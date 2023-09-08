//
//  MealsView.swift
//  SugarRush
//
//  Created by Mohammed Jameeluddin on 9/7/23.
//

import SwiftUI

struct MealsView: View {
    @ObservedObject var viewModel = MealsViewModel()
    @State private var ingredientsIsShowing: Bool = false
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
                        //                            .cornerRadius(Constants.Image.menuTileCornerRadius)
                        Divider()
                        SubHeaderText(text: meal.title,
                                      multiTextAlignment: .trailing,
                                      horizontalFixedSize: false,
                                      verticalFixedSize: true)
                        .padding()
                        Spacer()
                        InfoButton(ingredientsIsShowing: $ingredientsIsShowing)
                        Spacer()
                        Divider()
                        SubHeaderText(text: Constants.String.instructionTitle,
                                      multiTextAlignment: .center)
                        .padding()
                        LabelText(text: meal.instructions,
                                  multiTextAlignment: .center,
                                  horizontalFixedSize: false,
                                  verticalFixedSize: true)
                        .padding()
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
                    LabelText(text: Constants.String.tapForIngredients,
                              multiTextAlignment: .trailing)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    Image(systemName: "info.circle")
                }
                .padding(.horizontal, Constants.General.constraintsTopBottom)
            }
    }
}

