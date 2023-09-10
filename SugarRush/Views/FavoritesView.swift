//
//  FavoritesView.swift
//  SugarRush
//
//  Created by Mohammed Jameeluddin on 9/8/23.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var viewModel: FavoritesViewModel
    @State private var showAlert = false
    var body: some View {
        NavigationView {
            Form {
                ForEach(viewModel.addedItems, id: \.id) { meal in
                    NavigationLink(
                        destination:
                            MealDetailView(id: meal.id)
                        ,
                        label: {
                            ListRowView(imageURL: meal.image, title: meal.title)
                        })
                }
                .onDelete(perform: viewModel.remove)
            }
            .navigationBarTitle(Constants.String.favoritesTitle)
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                EditButton()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Opps!"),
                message: Text("No items added to favorites"),
                dismissButton: .default(Text("OK"))
            )
        }
        .onAppear {
            if viewModel.addedItems.count == 0 {
                showAlert = true
            }
        }
    }
}
