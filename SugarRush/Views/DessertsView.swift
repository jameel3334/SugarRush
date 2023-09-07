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
            List (viewModel.fetchedDesserts) { dessert in
                NavigationLink(destination: MealsView(id: dessert.id),
                               label:  { Text ("Hit it")} )
                
            }
        }
    }
}


