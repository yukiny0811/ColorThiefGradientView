// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import ColorThiefSwift

public struct GradientImageView: View {
    
    var color1: UIColor = .black
    var color2: UIColor = .black
    
    public init(image: UIImage) {
        guard let colors = ColorThief
            .getPalette(
                from: image,
                colorCount: 2,
                quality: 1,
                ignoreWhite: true
            ) else {
            return
        }
        guard colors.count == 2 else {
            return
        }
        color1 = colors[0].makeUIColor()
        color2 = colors[1].makeUIColor()
    }
    
    public var body: some View {
        LinearGradient(
            gradient: Gradient(
                colors: [
                    Color(cgColor: color1.cgColor),
                    Color(cgColor: color2.cgColor)
                ]
            ),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}
