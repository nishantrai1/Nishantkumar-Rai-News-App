//
//  ContentView.swift
//  Nishantkumar-Rai-Test
//
//  Created by Nishant Rai on 01/02/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ArticleViewModel()
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView(AppStrings.loadingHeadlinesTitle)
                        .progressViewStyle(.circular)
                        .padding()
                    Text(AppStrings.loadingHeadlinesSubTitle)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, 5)
                } else {
                    if let erroressage = viewModel.erroressage {
                        ErrorView(message: erroressage)
                    }
                    List {
                        ForEach(viewModel.articles) { article in
                            NavigationLink(destination: ArticleDetailsView(article: article)) {
                                ArticleListView(article: article)
                            }
                        }
                        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                    .navigationTitle(AppStrings.topHeadlinesTitle)
                }
            }
            .padding(.leading, 12)
        }
    }
}

#Preview {
    ContentView()
}
