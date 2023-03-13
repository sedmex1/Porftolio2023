//
//  SocialMediaApp.swift
//  SocialMedia
//
//  Created by Dominik Kowalewski on 04/01/2023.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore
import Firebase

@main
struct SocialMediaApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
