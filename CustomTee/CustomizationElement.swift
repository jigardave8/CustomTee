//
//  CustomizationElement.swift
//  CustomTee
//
//  Created by Jigar on 24/05/24.
//

import SwiftUI

enum CustomizationElementType {
    case text, image
}

struct CustomizationElement: Identifiable {
    let id = UUID()
    var type: CustomizationElementType
    var position: CGPoint
    var rotation: Angle = .zero
    var scale: CGFloat = 1.0
    var text: String? = nil
    var image: UIImage? = nil
    var color: Color = .black
    var fontSize: CGFloat = 20
}
