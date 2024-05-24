//
//  TShirtShape.swift
//  CustomTee
//
//  Created by Jigar on 24/05/24.
//

import SwiftUI

struct TShirtShape: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        
        let topWidth = width * 0.8
        let topHeight = height * 0.5
        let radius = width * 0.1
        
        var path = Path()
        
        path.move(to: CGPoint(x: width * 0.5, y: 0))
        path.addLine(to: CGPoint(x: width * 0.5 - topWidth / 2, y: topHeight))
        path.addQuadCurve(to: CGPoint(x: width * 0.5 - topWidth / 2 - radius, y: topHeight + radius), control: CGPoint(x: width * 0.5 - topWidth / 2, y: topHeight))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: width * 0.5 + topWidth / 2 + radius, y: topHeight + radius))
        path.addQuadCurve(to: CGPoint(x: width * 0.5 + topWidth / 2, y: topHeight), control: CGPoint(x: width * 0.5 + topWidth / 2, y: topHeight))
        path.addLine(to: CGPoint(x: width * 0.5, y: 0))
        
        return path
    }
}
