//
//  IngredientsView.swift
//  SugarRush
//
//  Created by Mohammed Jameeluddin on 9/8/23.
//

import SwiftUI

struct IngredientsView: View {
    var text: [String]
    var body: some View {
        VStack(spacing: 10){
            HeaderTextView(text: Constants.String.ingredientsViewTitle,
                           multiTextAlignment: .center,
                           color: Color(Constants.Color.textColor))
            .padding()
            ForEach(text, id: \.self) { item in
                BodyTextView(text: item, multiTextAlignment: .leading)
            }
        }
    }
}

struct IngredientsView_Preview: PreviewProvider {
    static var previews: some View {
        IngredientsView(text: [
            "Eggs - 2",
            "Oil - 1 Cup",
            "Pepper - 1/2 tsp",
            "Salt - 1/2 tsp"
        ])
    }
}
