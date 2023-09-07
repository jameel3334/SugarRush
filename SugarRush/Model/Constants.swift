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
        public static let textColor = "textViewColor"
        public static let accentColor = "AccentColor"
    }
    enum General {
        public static let roundedSymbolDimensions: CGFloat = 30.0
        public static let roundedTextDimensions: CGFloat = 46.0
        public static let constraintsLeftRight: CGFloat = 30.0
        public static let constraintsTopBottom: CGFloat = 10.0
        public static let roundedStrokeWidth: CGFloat = 3.0
        public static let roundedBuyStrokeWidth: CGFloat = 6.0
        public static let cornerRadius: CGFloat = 12.0
        public static let greaterCornerRadius: CGFloat = 22.0
        public static let opacityBackground: CGFloat = 0.3
    }
    enum Image {
        public static let mobileAppImage = "mainStart"
        public static let leftSpoonAppImage = "leftSpoonStart"
        public static let menuTileHeightWidth: CGFloat = 80.0
        public static let menuTileCornerRadius: CGFloat = 12.0
        public static let portraitViewImageDimensions: CGFloat = 350.0
        public static let landscapeViewImageDimensions: CGFloat = 200.0
        public static let defaultMenuImage = "defaultMenuImage"
    }
    enum String {
        public static let dessertsTitleName = "DESSERTS"
    }
}
