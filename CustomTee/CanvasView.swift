//
//  CanvasView.swift
//  CustomTee
//
//  Created by Jigar on 24/05/24.
//
import SwiftUI

struct CanvasView: View {
    @Binding var elements: [CustomizationElement]
    @Binding var selectedElement: CustomizationElement?

    var body: some View {
        ZStack {
            TShirtShape()
                            .fill(Color.white)
                            .frame(width: 300, height: 400)
                            .border(Color.gray, width: 1)

            ForEach(elements) { element in
                Group {
                    if element.type == .text, let text = element.text {
                        Text(text)
                            .font(.system(size: element.fontSize))
                            .foregroundColor(element.color)
                            .rotationEffect(element.rotation)
                            .scaleEffect(element.scale)
                            .position(element.position)
                    } else if element.type == .image, let image = element.image {
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .rotationEffect(element.rotation)
                            .scaleEffect(element.scale)
                            .position(element.position)
                    }
                }
                .gesture(DragGesture()
                            .onChanged { value in
                                if selectedElement?.id == element.id {
                                    elements = elements.map {
                                        var updatedElement = $0
                                        if updatedElement.id == element.id {
                                            updatedElement.position = value.location
                                        }
                                        return updatedElement
                                    }
                                }
                            })
                .gesture(MagnificationGesture()
                            .onChanged { value in
                                if selectedElement?.id == element.id {
                                    elements = elements.map {
                                        var updatedElement = $0
                                        if updatedElement.id == element.id {
                                            updatedElement.scale = value
                                        }
                                        return updatedElement
                                    }
                                }
                            })
                .gesture(RotationGesture()
                            .onChanged { value in
                                if selectedElement?.id == element.id {
                                    elements = elements.map {
                                        var updatedElement = $0
                                        if updatedElement.id == element.id {
                                            updatedElement.rotation = value
                                        }
                                        return updatedElement
                                    }
                                }
                            })
                .contextMenu {
                    Button(action: {
                        elements.removeAll { $0.id == element.id }
                    }) {
                        Text("Delete")
                        Image(systemName: "trash")
                    }
                }
                .onTapGesture {
                    selectedElement = element
                }
            }
        }
    }
}
