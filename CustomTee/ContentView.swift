//
//  ContentView.swift
//  CustomTee
//
//  Created by Jigar on 24/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            BrowseView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }

            CustomizationView()
                .tabItem {
                    Image(systemName: "paintbrush.fill")
                    Text("Customize")
                }

            CartView()
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Cart")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}

@main
struct CustomTShirtApp: App {
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
        }
    }
}
