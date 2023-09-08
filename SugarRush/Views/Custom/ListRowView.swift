//
//  ListRowView.swift
//  SugarRush
//
//  Created by Mohammed Jameeluddin on 9/7/23.
//

import SwiftUI

struct ListRowView: View {
    let imageURL: String
    let title: String
    var body: some View {
        HStack {
            ListRowImageView(imageURL: imageURL)
                .frame(width: Constants.Image.menuTileHeightWidth, height: Constants.Image.menuTileHeightWidth)
                .cornerRadius(Constants.Image.menuTileCornerRadius)
                .padding(.vertical, Constants.General.constraintsTopBottom)
            SubHeaderText(text: title,
                          multiTextAlignment: .leading)
                .padding( Constants.General.constraintsTopBottom)
        }
    }
}
