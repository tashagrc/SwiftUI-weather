//
//  ContentView.swift
//  SwiftUI-weather
//
//  Created by Natasha Radika on 11/03/24.
//

import SwiftUI

struct ContentView: View {
    // make struct hold state
    @State private var isNight = false
    var body: some View {
        // background area
        ZStack {
            BackgroundView(topColor: isNight ? .black : .blue,
                           bottomColor: isNight ? .gray : Color("lightBlue"))
            VStack {
                // text font wrapped by foreground color
                // order modifier matter
                CityTextView(cityName: "Jakarta, Indonesia")
                // bikin textnya naik dan sisanya yg bawah itu spacer
                // Spacer()
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 75)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 74)
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 88)
                    WeatherDayView(dayOfWeek: "THU", imageName: "wind.snow", temperature: 60)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "sun.haze.fill", temperature: 50)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "snow", temperature: 10)
                }
                Spacer()
                Button {
                    isNight.toggle()
                } label : {
                    WeatherButtonView(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                Spacer()
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}

// ctrl click > extract subview
struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack {
            Text(dayOfWeek).font(.system(size: 16, weight: .medium, design: .default)).foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°").font(.system(size: 26, weight: .medium)).foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/,
                       endPoint: .bottomLeading).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName).font(.system(size: 32, weight: .medium, design: .default)).foregroundColor(.white).padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°").font(.system(size: 70, weight: .bold)).foregroundColor(.white)
        }.padding(.bottom, 50)
    }
}


