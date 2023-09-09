//
//  TabViews.swift
//  SugarRush
//
//  Created by Mohammed Jameeluddin on 9/7/23.
//

import SwiftUI

struct TabViews: View {
    @EnvironmentObject var viewModel: FavoritesViewModel
    var body: some View {
        TabView {
            DessertsView()
                .tabItem {
                    Image(systemName: "book.closed")
                    Text("Menu")
                }
                .tag(0)
            FavoritesView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorite")
                }
                .tag(1)
                .badge(viewModel.addedItems.count)
        }
    }
}
