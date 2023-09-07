//
//  TextViews.swift
//  SugarRush
//
//  Created by Mohammed Jameeluddin on 9/7/23.
//


import SwiftUI

struct TextViews: View {
    var body: some View {
                SubHeaderText(text: "Hello!")
        }
}

struct SubHeaderText: View {
    var text: String
    var body: some View {
        
        Text(text.uppercased())
            .foregroundColor(Color(Constants.Color.textColor))
            .font(.headline)
            .lineLimit(nil)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        TextViews()
    }
}
