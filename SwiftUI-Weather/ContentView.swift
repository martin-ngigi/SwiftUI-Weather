//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Martin Wainaina on 11/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    /****
     Using @Bingding When passing isNight down the hierachy to the children will make sure the passed data is the same.
     */
    
    var body: some View {
        /// ZStack only takes a maximum of 10 direct children views
        ZStack {
            
            ///Overall Background
            BackgroundView(isNight: isNight)
            
            VStack{
                /// City Name
                CityTextView(cityName: "Capertino, CA")
                
                
                MainWeatherStatusView(imageName:   isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
                
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 76)
                    
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 88)
                    
                    WeatherDayView(dayOfWeek: "THR",
                                   imageName: "wind.snow",
                                   temperature: 55)
                    
                    WeatherDayView(dayOfWeek: "FRD",
                                   imageName: "sunset.fill",
                                   temperature: 60)
                    
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "snow",
                                   temperature: 25)
                }
                
                Spacer()
                
                
                Button{
                    print("-----> Tapped WeatherButtonView ")
                    isNight.toggle()
                } label: {
                    WeatherButtonView(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
                
                
                    
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            ///Day of the week
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
            ///Icon
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            /// Temperature
            Text("\(temperature)'")
                .font(.system(size: 28,weight: .medium))
                .foregroundColor(.white)
            
            
        }
    }
}

struct BackgroundView: View {
    var isNight: Bool

    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
            startPoint: .topLeading,
            endPoint: .bottomLeading
        )
        .ignoresSafeArea(.all)
        
        ///OR
        
//        ContainerRelativeShape()
//            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
//            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text("Capertino, CA")
            .font(.system(size: 32,weight:.medium,design:.default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body :  some View{
        VStack(spacing: 10){
            ///Icon
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            /// Temperature
            Text("\(temperature)'")
                .font(.system(size: 78,weight: .medium))
                .foregroundColor(.white)
        
        }
        .padding(.bottom, 40)
    }
    
}


