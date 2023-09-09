//
//  Constants.swift
//  SugarRush
//
//  Created by Mohammed Jameeluddin on 9/7/23.
//

import Foundation


enum Constants {
    enum Url {
        public static let mealBaseURL = "https://themealdb.com/api/json/v1/1/lookup.php?i="
        public static let dessertsURL = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    }
    enum Color {
        public static let textColor   = "textViewColor"
        public static let accentColor = "AccentColor"
    }
    enum General {
        public static let constraintsTopBottom: CGFloat = 10.0
        public static let opacityBackground: CGFloat    = 0.05
    }
    enum Image {
        public static let mobileAppImage                       = "mainStart"
        public static let leftSpoonAppImage                    = "leftSpoonStart"
        public static let menuTileHeightWidth: CGFloat         = 80.0
        public static let menuTileCornerRadius: CGFloat        = 12.0
        public static let portraitViewImageDimensions: CGFloat = 400.0
        public static let mealPlaceholderImage                 = "mealPlaceholder"
    }
    enum String {
        public static let dessertsTitle         = "DESSERTS"
        public static let favoritesTitle        = "FAVORITES"
        public static let instructionTitle      = "Instructions"
        public static let instrructionViewTitle = "Ingredients - Measurements"
        public static let tapForIngredients     = "Tap me for Ingredients"
    }
}
