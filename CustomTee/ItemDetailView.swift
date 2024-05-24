//
//  ItemDetailView.swift
//  CustomTee
//
//  Created by Jigar on 24/05/24.
//

import SwiftUI

struct ItemDetailView: View {
    let item: Item
    @Binding var cartItems: [Item]

    var body: some View {
        VStack {
            // Display item details
            Text("Item Detail")
                .font(.title)
                .padding()
            Image(systemName: item.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()
            Text(item.title)
                .font(.headline)
                .padding()

            // Add to Cart button
            Button(action: {
                cartItems.append(item)
            }) {
                Text("Add to Cart")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            Spacer()
        }
    }
}
