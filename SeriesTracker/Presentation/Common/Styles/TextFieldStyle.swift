//
//  TextFieldStyle.swift
//  SeriesTracker
//
//  Created by Artyom Nesterenko on 18/10/2023.
//

import SwiftUI

struct ColorRoundedBorderTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.blue, lineWidth: 2)
            )
    }
}

extension TextFieldStyle where Self == ColorRoundedBorderTextFieldStyle {

    /// A text field style with a custom-defined color rounded border.
    static var colorRoundedBorder: ColorRoundedBorderTextFieldStyle {
        ColorRoundedBorderTextFieldStyle()
    }
}
