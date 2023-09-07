//
//  TabViews.swift
//  SugarRush
//
//  Created by Mohammed Jameeluddin on 9/7/23.
//

import SwiftUI

struct TabViews: View {
    var body: some View {
        TabView {
            DessertsView()
                .tabItem {
                    Image(systemName: "book.closed")
                    Text("Menu")
                }
                .tag(0)
        }
    }
}
