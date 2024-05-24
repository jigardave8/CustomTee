//
//  BrowseView.swift
//  CustomTee
//
//  Created by Jigar on 24/05/24.
//

import SwiftUI

struct BrowseView: View {
    @State private var viewType: ViewType = .grid // Default view type is grid
    @State private var scale: CGFloat = 1.0 // Default scale is 1.0
    // Sample data for demonstration
    let sampleImages = Array(repeating: "photo", count: 20) // Using system photo placeholder image
    
    var body: some View {
        VStack {
            // View type selector
            Picker("View Type", selection: $viewType) {
                Text("Grid").tag(ViewType.grid)
                Text("List").tag(ViewType.list)
                // Add more view types here if needed
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            // Browse content
            ScrollView {
                if viewType == .grid {
                    // Grid view
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 10) {
                        ForEach(sampleImages, id: \.self) { imageName in
                            Image(systemName: imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100 * scale, height: 100 * scale)
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                } else {
                    // List view
                    ForEach(sampleImages, id: \.self) { imageName in
                        HStack {
                            Image(systemName: imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50 * scale, height: 50 * scale)
                                .cornerRadius(8)
                            Text("Image Title")
                                .font(.headline)
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
            }
            
            // Scale slider
            Slider(value: $scale, in: 0.5...2.0, step: 0.1) {
                Text("Scale")
            }
            .padding()
        }
        .navigationTitle("Browse")
    }
    
    enum ViewType {
        case grid, list
    }
}
