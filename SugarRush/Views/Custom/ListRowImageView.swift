//
//  ListRowImageView.swift
//  SugarRush
//
//  Created by Mohammed Jameeluddin on 9/7/23.
//

import SwiftUI

struct ListRowImageView: View {
    let imageURL: String?
    var body: some View {
        if let imageURL = imageURL {
            CacheAsyncImage(url: URL(string: imageURL) ?? URL(string: Constants.Image.mealPlaceholderImage)!,
                            content: { phase in
                switch phase {
                case .empty :
                    Image(uiImage: UIImage(named: Constants.Image.mealPlaceholderImage) ?? UIImage())
                        .resizable()
                        .overlay {
                            if URL(string: imageURL) != nil {
                                ProgressView()
                                    .frame(maxWidth: .infinity,
                                           maxHeight: .infinity)
                                    .background(.gray.opacity(0.4))
                            }
                        }
                        .frame(width: Constants.Image.menuTileHeightWidth, height: Constants.Image.menuTileHeightWidth)
                        .cornerRadius(Constants.Image.menuTileCornerRadius)
                case .success(let image):
                    image
                        .resizable()
                        .frame(width: Constants.Image.menuTileHeightWidth, height: Constants.Image.menuTileHeightWidth)
                        .cornerRadius(Constants.Image.menuTileCornerRadius)
                case .failure:
                    Image(uiImage: UIImage(named: Constants.Image.mealPlaceholderImage) ?? UIImage())
                        .resizable()
                        .frame(width: Constants.Image.menuTileHeightWidth, height: Constants.Image.menuTileHeightWidth)
                        .cornerRadius(Constants.Image.menuTileCornerRadius)
                @unknown default:
                    EmptyView()
                }
            }
            )}
    }
}
