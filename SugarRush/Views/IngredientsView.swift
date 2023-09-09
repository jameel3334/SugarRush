//
//  IngredientsView.swift
//  SugarRush
//
//  Created by Mohammed Jameeluddin on 9/8/23.
//

import SwiftUI

struct IngredientsView: View {
    var ingredientsAndMeasures: [String]
    var body: some View {
        VStack {
            HeaderTextView(text: Constants.String.instrructionViewTitle,
                          multiTextAlignment: .center)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
            List(ingredientsAndMeasures, id: \.self) { item in
                Text(item)
            }
        }
    }
}
