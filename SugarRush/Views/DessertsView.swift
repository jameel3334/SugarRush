//
//  DessertsView.swift
//  SugarRush
//
//  Created by Mohammed Jameeluddin on 9/7/23.
//

import SwiftUI

struct DessertsView: View {
    @StateObject var viewModel = DessertsViewModel()
    var body: some View {
        NavigationView {
            List (viewModel.fetchedDesserts.sorted(by: { $0.title < $1.title })) { dessert in
                NavigationLink(destination:
                                MealDetailView(id: dessert.id),
                               label:  {
                    ListRowView(imageURL: dessert.image,
                                title: dessert.title)
                })
            }
            .task { viewModel.fetchDessertData() }
            .navigationBarTitle(Constants.String.dessertsTitle)
            .navigationBarTitleDisplayMode(.large)
        }
    }
}



