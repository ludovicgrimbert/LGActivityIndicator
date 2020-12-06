//
//  AIV+Ext.swift
//  TransParis
//
//  Created by Ludovic Grimbert on 06/12/2020.
//  Copyright © 2020 ludovic grimbert. All rights reserved.
//

import Foundation
import SwiftUI

struct CircleDotsIndicatorView: View {

    let count: Int

    var body: some View {
        GeometryReader { geometry in
            ForEach(0..<self.count) { index in
                CircleDotsIndicatorItemView(index: index, size: geometry.size)
            }.frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

struct CircleDotsIndicatorItemView: View {

    let index: Int
    let size: CGSize

    @State private var scale: CGFloat = 0.01
    @State private var rotation: Double = 0

    var body: some View {
        let animation = Animation
            .timingCurve(0.5, 0.15 + Double(index) / 5, 0.25, 1, duration: 1.5)
            .repeatForever(autoreverses: false)

        return Circle()
            .frame(width: size.width / 5, height: size.height / 5)
            .scaleEffect(scale)
            .offset(y: size.width / 10 - size.height / 2)
            .rotationEffect(.degrees(rotation))
            .onAppear {
                self.rotation = 0
                self.scale = (5 - CGFloat(self.index)) / 5
                withAnimation(animation) {
                    self.rotation = 360
                    self.scale = (1 + CGFloat(self.index)) / 5
                }
            }
    }
}
