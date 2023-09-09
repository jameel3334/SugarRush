//
//  SugarRushApp.swift
//  SugarRush
//
//  Created by Mohammed Jameeluddin on 9/7/23.
//

import SwiftUI

@main
struct SugarRushApp: App {
    @StateObject var favouriteViewModel = FavoritesViewModel()
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(favouriteViewModel)
        }
    }
}
