//
//  GhostDotsIndicatorView.swift
//  TransParis
//
//  Created by Ludovic Grimbert on 06/12/2020.
//  Copyright © 2020 ludovic grimbert. All rights reserved.
//

import Foundation
import SwiftUI

struct GhostDotsIndicatorView: View {
    
    let count: Int
    private let inset: Int = 4
    
    var body: some View {
        GeometryReader { geometry in
            ForEach(0..<self.count) { index in
                GhostDotsIndicatorItemView(index: index, count: self.count, inset: self.inset, size: geometry.size)
            }.frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

struct GhostDotsIndicatorItemView: View {
    
    let index: Int
    let count: Int
    let inset: Int
    let size: CGSize
    
    @State private var scale: CGFloat = 0
    @State private var opacity: Double = 0
    
    var body: some View {
        let itemSize = (size.width - CGFloat(inset) * CGFloat(count - 1)) / CGFloat(count)
        
        let animation = Animation.easeOut
            .repeatForever(autoreverses: true)
            .delay(index % 2 == 0 ? 0.2 : 0)
        
        return Circle()
            .frame(width: itemSize, height: itemSize)
            .scaleEffect(scale)
            .opacity(opacity)
            .onAppear {
                self.scale = 1
                self.opacity = 1
                withAnimation(animation) {
                    self.scale = 0.9
                    self.opacity = 0.3
                }
            }
            .offset(x: (itemSize + CGFloat(inset)) * CGFloat(index) - size.width / 2 + itemSize / 2)
    }
}
