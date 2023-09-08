//
//  TextViews.swift
//  SugarRush
//
//  Created by Mohammed Jameeluddin on 9/7/23.
//


import SwiftUI

struct TextViews: View {
    var body: some View {
        VStack {
            SubHeaderText(text: "Hello!", multiTextAlignment: .trailing)
            LabelText(text: "Hello!", multiTextAlignment: .center)
        }
    }
}

struct SubHeaderText: View {
    var text: String
    var multiTextAlignment: TextAlignment
    var horizontalFixedSize: Bool?
    var verticalFixedSize: Bool?
    var body: some View {
        
        Text(text.uppercased())
            .foregroundColor(Color(Constants.Color.textColor))
            .font(.headline)
            .lineLimit(nil)
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(multiTextAlignment)
            .fixedSize(horizontal: horizontalFixedSize ?? false, vertical: verticalFixedSize ?? true)
    }
}

struct LabelText: View {
    var text: String
    var multiTextAlignment: TextAlignment
    var horizontalFixedSize: Bool?
    var verticalFixedSize: Bool?
    var body: some View {
        
        Text(text)
            .fontWeight(.regular)
            .lineSpacing(20)
            .font(.body)
            .foregroundColor(Color(Constants.Color.textColor))
            .multilineTextAlignment(multiTextAlignment)
            .fixedSize(horizontal: horizontalFixedSize ?? false, vertical: verticalFixedSize ?? true)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        TextViews()
    }
}
