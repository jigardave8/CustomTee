//
//  CustomizationView.swift
//  CustomTee
//
//  Created by Jigar on 24/05/24.
//
import SwiftUI


struct CustomizationView: View {
    @State private var elements: [CustomizationElement] = []
    @State private var selectedElement: CustomizationElement?
    @State private var selectedColor: Color = .black
    @State private var inputText: String = ""
    @State private var fontSize: CGFloat = 20
    @State private var showImagePicker: Bool = false
    @State private var pickedImage: UIImage? = nil
    
    var body: some View {
        VStack {
            ScrollView {
                CanvasView(elements: $elements, selectedElement: $selectedElement)
                    .frame(height: 400)
                    .padding()

                CustomizationToolsView(elements: $elements, selectedElement: $selectedElement, selectedColor: $selectedColor, inputText: $inputText, fontSize: $fontSize, showImagePicker: $showImagePicker)
            }

            Spacer()
        }
        .background(Color.gray.opacity(0.1)) // Set background color
        .navigationBarTitle("Customize T-Shirt")
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: $pickedImage)
                .onChange(of: pickedImage) { newImage in
                    if let image = newImage {
                        let newElement = CustomizationElement(type: .image, position: CGPoint(x: 150, y: 150), image: image)
                        elements.append(newElement)
                        selectedElement = newElement
                    }
                }
        }
    }
}
