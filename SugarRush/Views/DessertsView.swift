//
//  DessertsView.swift
//  SugarRush
//
//  Created by Mohammed Jameeluddin on 9/7/23.
//

import SwiftUI

struct DessertsView: View {
    @StateObject var viewModel       = DessertsViewModel()
    @State var dessertAlertIsShowing = false
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
            .navigationBarTitle(Constants.String.dessertsTitle)
            .navigationBarTitleDisplayMode(.large)
            .task {
                do {
                    try await viewModel.fetchDessertData()
                } catch {
                    dessertAlertIsShowing = true
                }}
            .alert(isPresented: $dessertAlertIsShowing) {
                Alert(
                    title: Text(Constants.String.alertTitle),
                    message: Text(Constants.String.alertMessage),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}



