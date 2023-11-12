//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Martin Wainaina on 11/11/2023.
//

import SwiftUI

struct WeatherButtonView: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor.gradient)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(15)
    }
}

struct WeatherButton_Previews: PreviewProvider{
    static var previews: some View{
        WeatherButtonView(title: "Test title", textColor: .white, backgroundColor: .blue)
    }
}
