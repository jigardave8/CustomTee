//
//  SplashScreenView.swift
//  CustomTee
//
//  Created by Jigar on 24/05/24.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false

    var body: some View {
        VStack {
            if isActive {
                ContentView()
            } else {
                VStack {
                    Image(systemName: "tshirt")
                        .resizable()
                        .frame(width: 100, height: 100)
                    Text("T-Shirt Customizer")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }
}
