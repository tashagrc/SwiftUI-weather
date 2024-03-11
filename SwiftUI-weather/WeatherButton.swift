//
//  WeatherButton.swift
//  SwiftUI-weather
//
//  Created by Natasha Radika on 11/03/24.
//

import SwiftUI

struct WeatherButtonView: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    var body: some View {
        Text(title)
            .frame(width: 200, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
