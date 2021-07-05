//
//  Modifiers.swift
//  WidgetAppGroup
//
//  Created by Ashlee Muscroft on 21/06/2021.
//

import SwiftUI

struct bodyFontModifier: ViewModifier {
    @Environment(\.widgetFamily) private var widgetFamily
    func body(content: Content) -> some View {
        if widgetFamily == .systemLarge {
            content.modifier(largeFontModifier())
        } else {
            content.modifier(smallFontModifier())
        }
    }
}

struct smallFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.body)
            .minimumScaleFactor(0.7)
            .foregroundColor(.white)
            .shadow(radius: 10)
            .shadow(radius: 15)
    }
}
struct largeFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.title2)
            .minimumScaleFactor(0.5)
            .foregroundColor(.white)
            .shadow(radius: 10)
            .shadow(radius: 5)
    }
}
