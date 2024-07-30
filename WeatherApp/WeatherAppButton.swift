//
//  WeatherAppButton.swift
//  WeatherApp
//
//  Created by Soumil Malhotra on 10/07/24.
//

import Foundation
import SwiftUI

struct ButtonView : View {
    var buttonText: String
    var backgroundColor: Color
    var textColor: Color
    var body: some View {
        Text(buttonText)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .cornerRadius(10)
            .font(.system(size: 20, weight: .bold))
            .foregroundColor(textColor)

    }
}
