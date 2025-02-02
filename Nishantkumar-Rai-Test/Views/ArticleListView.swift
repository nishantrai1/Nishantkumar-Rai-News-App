//
//  ArticleListView.swift
//  Nishantkumar-Rai-Test
//
//  Created by Nishant Rai on 01/02/25.
//

import SwiftUI

struct ArticleListView: View {
    let article: Article
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: article.urlToImage ?? "")) { image in
                    image.resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Image(systemName: AppImages.systemPlaceholder)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
            }
            .clipped()
            .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(article.title)
                    .font(.headline)
                    .lineLimit(2)
                
                Text(article.description ?? "")
                    .font(.subheadline)
                    .lineLimit(2)
            }
            .padding(.bottom, 16)
        }
    }
}

#Preview {
    ArticleListView(article: Article(title: "Federal employees confused, angered by Trump’s offer to quit - CNN", description: "President Donald Trump’s offer to most federal employees to resign now and be paid through September stunned the workers who received it — angering some, confusing many and raising questions about whether the offer is even legal.", urlToImage: "https://media.cnn.com/api/v1/images/stellar/prod/gettyimages-1258923564-restricted-20250201005321342.jpg?c=16x9&q=w_800,c_fill"))
}
