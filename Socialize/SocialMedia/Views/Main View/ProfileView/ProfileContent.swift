//
//  ProfileContent.swift
//  SocialMedia
//
//  Created by Dominik Kowalewski on 15/01/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileContent: View {
    var user: User
    @State private var fetchedPosts: [Post] = []
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                HStack(spacing: 12) {
                    WebImage(url: user.userProfileURL).placeholder {
                        //MARK: Placeholder Image
                        
                        Image("NullProfile")
                            .resizable()
                    }
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text(user.username)
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text(user.userBio)
                            .font(.caption)
                            .foregroundColor(.gray)
                            .lineLimit(3)
                        
                        if let bioLink = URL(string: user.userBioLink) {
                            Link(user.userBioLink, destination: bioLink)
                                .font(.callout)
                                .tint(.blue)
                                .lineLimit(1)
                        }
                    }
                    .hAlign(.leading)
                    .padding(.horizontal, 10)
                }
                .hAlign(.leading)
                .padding(.horizontal, 20)
                .padding(.top, 15)
                
                Text("Posts")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .hAlign(.leading)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                
                ReusablePostsView(basedOnUID: true, uid: user.userUID, posts: $fetchedPosts )
            }
            .padding(15)
        }
    }
}

struct ProfileContent_Previews: PreviewProvider {
    static var previews: some View {
        ProfileContent(user: User(username: "test", userBio: "test", userBioLink: "test.com", userUID: "KdgkH6ST6JWNpmVhaV6HvM20Dy43", userEmail: "Test@123.pl", userProfileURL: URL(string: "https://firebasestorage.googleapis.com:443/v0/b/socialmediaapp-df899.appspot.com/o/Profile_Images%2FKdgkH6ST6JWNpmVhaV6HvM20Dy43?alt=media&token=746895ed-1daf-43c9-ae27-35d43acc3524")!))
    }
}
