//
//  MealsView.swift
//  SugarRush
//
//  Created by Mohammed Jameeluddin on 9/7/23.
//

import SwiftUI

struct MealsView: View {
    @ObservedObject var viewModel = MealsViewModel()
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
                }
            }
            .task { viewModel.fetchMealsData(using: id) }
        }
    }
}

