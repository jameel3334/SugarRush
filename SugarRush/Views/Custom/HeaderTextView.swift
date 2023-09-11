//
//  HeaderTextView.swift
//  SugarRush
//
//  Created by Mohammed Jameeluddin on 9/10/23.
//

import SwiftUI

struct HeaderTextView: View {
    var text: String
    var multiTextAlignment: TextAlignment
    var horizontalFixedSize: Bool?
    var verticalFixedSize: Bool?
    var color: Color?
    var body: some View {
        Text(text.uppercased())
            .foregroundColor(color)
            .font(.title3.weight(.bold))
            .lineLimit(1)
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(multiTextAlignment)
            .fixedSize(horizontal: horizontalFixedSize ?? false, vertical: verticalFixedSize ?? true)
    }
}

struct HeaderTextView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderTextView(text: "Hello!", multiTextAlignment: .trailing)
    }
}
