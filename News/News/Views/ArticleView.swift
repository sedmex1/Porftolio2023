//
//  ArticleView.swift
//  News
//
//  Created by Dominik Kowalewski on 14/03/2023.
//

import SwiftUI
import URLImage

struct ArticleView: View {
    
    let article: Article
    
    var body: some View {
        HStack {
            if let imageUrl = article.image,
               let url = URL(string: imageUrl) {
                
                URLImage(url, identifier: article.id.uuidString) { error, _ in
                    Image(systemName: "photo.fill")
                        .foregroundColor(.white)
                        .background(.gray)
                        .frame(width: 100, height: 100)
                } content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            } else {
                Image(systemName: "photo.fill")
                    .foregroundColor(.white)
                    .background(.gray)
                    .frame(width:100, height: 100)
            }
            
            VStack (alignment: .leading, spacing: 4){
                Text(article.title ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 14, weight: .semibold))
                Text(article.source ?? "")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.dummyData[0])
            .previewLayout(.sizeThatFits)
    }
}
