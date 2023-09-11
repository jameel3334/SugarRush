//
//  HomeView.swift
//  SugarRush
//
//  Created by Mohammed Jameeluddin on 9/7/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var viewModel: FavoritesViewModel
    
    var body: some View {
        TabView {
            DessertsListView()
                .tabItem {
                    Image(systemName: Constants.Image.bookClosed)
                    Text("Menu")
                }
                .tag(0)
            FavoritesView()
                .tabItem {
                    Image(systemName: Constants.Image.heart)
                    Text("Favorite")
                }
                .tag(1)
                .badge(viewModel.addedItems.count)
        }
    }
}

struct TabViews_Preview: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
