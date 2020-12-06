//
//  ActivityIndicatorview.swift
//  GetCity
//
//  Created by Ludovic Grimbert on 11/05/2020.
//  Copyright © 2020 ludovic grimbert. All rights reserved.
//

import Foundation
import SwiftUI

public struct LGActivityIndicatorView: View {
    
    public enum IndicatorType {
        case circleDots(count: Int)
        case ghostDots(count: Int)
    }
    
    @Binding var isVisible: Bool
    var type: IndicatorType
    
    public init(isVisible: Binding<Bool>, type: IndicatorType) {
        self._isVisible = isVisible
        self.type = type
    }
    
    public var body: some View {
        guard isVisible else { return AnyView(EmptyView()) }
        
        switch type {
        case .circleDots(let count):
            return AnyView(CircleDotsIndicatorView(count: count))
        case .ghostDots(let count):
            return AnyView(GhostDotsIndicatorView(count: count))
        }
    }
}

