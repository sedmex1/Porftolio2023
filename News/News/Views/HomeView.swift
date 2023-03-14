//
//  HomeView.swift
//  News
//
//  Created by Dominik Kowalewski on 14/03/2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = NewsViewModelImpl(service: NewsServiceImpl())
    @Environment(\.openURL) var openUrl
    
    var body: some View {
        
        Group {
            
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .failed(let error):
                ErrorView(error: error, handler: viewModel.getArticles)
            case .success(let articles):
                NavigationView {
                    VStack {
                        Text("News 📃")
                            .font(.title)
                            .fontWeight(.bold)
                        List(articles) { item in
                            ArticleView(article: item)
                                .onTapGesture {
                                    load(url: item.url)
                                }
                        }
                        .listStyle(PlainListStyle())
                    }
                }
            }
        }
        .onAppear(perform: viewModel.getArticles)
    }
    
    func load(url: String?) {
        guard let link = url,
              let url = URL(string: link) else {return}
        
        openUrl(url)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
