//
//  ArticleDetailsView.swift
//  Nishantkumar-Rai-Test
//
//  Created by Nishant Rai on 01/02/25.
//

import SwiftUI

struct ArticleDetailsView: View {
    let article: Article
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            AsyncImage(url: URL(string: article.urlToImage ?? "")) { image in
                image.resizable()
                    .scaledToFit()
                    .cornerRadius(12)
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Image(systemName: AppImages.systemPlaceholder)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
            }
            .clipped()
            
            Text(article.title)
                .font(.title)
                .bold()
            
            Text(article.description ?? "")
                .font(.body)
                .padding(.top, 5)
            
            Spacer()
        }
        .padding()
        .navigationTitle(AppStrings.topHeadlineDetailsTitle)
    }
}

#Preview {
    ArticleDetailsView(article: Article(title: "Test title", description: "TestDescription", urlToImage: "https://media.cnn.com/api/v1/images/stellar/prod/gettyimages-1258923564-restricted-20250201005321342.jpg?c=16x9&q=w_800,c_fill"))
                                        }
