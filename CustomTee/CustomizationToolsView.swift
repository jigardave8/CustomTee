//
//  CustomizationToolsView.swift
//  CustomTee
//
//  Created by Jigar on 24/05/24.
//

import SwiftUI

struct CustomizationToolsView: View {
    @Binding var elements: [CustomizationElement]
    @Binding var selectedElement: CustomizationElement?
    @Binding var selectedColor: Color
    @Binding var inputText: String
    @Binding var fontSize: CGFloat
    @Binding var showImagePicker: Bool

    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Button(action: {
                    let newElement = CustomizationElement(type: .text, position: CGPoint(x: 150, y: 150), text: "New Text", color: selectedColor, fontSize: fontSize)
                    elements.append(newElement)
                    selectedElement = newElement
                }) {
                    Text("Add Text")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Button(action: {
                    showImagePicker.toggle()
                }) {
                    Text("Add Image")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }

            if let selectedElement = selectedElement {
                if selectedElement.type == .text {
                    TextField("Enter Text", text: $inputText, onCommit: {
                        if let index = elements.firstIndex(where: { $0.id == selectedElement.id }) {
                            elements[index].text = inputText
                        }
                    })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    
                    Slider(value: $fontSize, in: 10...100, step: 1) {
                        Text("Font Size")
                    }
                    .padding()
                    .onChange(of: fontSize) { newSize in
                        if let index = elements.firstIndex(where: { $0.id == selectedElement.id }) {
                            elements[index].fontSize = newSize
                        }
                    }
                }

                ColorPicker("Pick Color", selection: $selectedColor)
                    .padding()
                    .onChange(of: selectedColor) { newColor in
                        if let index = elements.firstIndex(where: { $0.id == selectedElement.id }) {
                            elements[index].color = newColor
                        }
                    }

                Text("Rotation")
                Slider(value: Binding(
                    get: { selectedElement.rotation.degrees },
                    set: { newDegrees in
                        if let index = elements.firstIndex(where: { $0.id == selectedElement.id }) {
                            elements[index].rotation = Angle(degrees: newDegrees)
                        }
                    }
                ), in: 0...360, step: 1)
                .padding()

                Text("Scale")
                Slider(value: Binding(
                    get: { selectedElement.scale },
                    set: { newScale in
                        if let index = elements.firstIndex(where: { $0.id == selectedElement.id }) {
                            elements[index].scale = newScale
                        }
                    }
                ), in: 0.1...3, step: 0.1)
                .padding()

                Button(action: {
                    elements.removeAll { $0.id == selectedElement.id }
                    self.selectedElement = nil
                }) {
                    Text("Delete Element")
                        .foregroundColor(.red)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
                .padding(.top)
            }
        }
        .padding()
    }
}
