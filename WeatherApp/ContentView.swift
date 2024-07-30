//
//  ContentView.swift
//  WeatherApp
//
//  Created by Soumil Malhotra on 10/07/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var isNight = false
    var daysList: [Array<String>] = [["MON", "cloud.sun.fill", "78"], ["MON", "cloud.sun.fill", "78"], ["MON", "cloud.sun.fill", "78"], ["MON", "cloud.sun.fill", "78"], ["MON", "cloud.sun.fill", "78"]]
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight, topColor: .blue, bottomColor: Color("lightBlue"))
            
            VStack {
                CityView(cityName: "Cupertino, CA")
                
                
                MainWeatherView(imageName: "cloud.sun.fill", temperature: 78)
                .padding(.bottom, 50)
                HStack(spacing:20) {
                    
                    ForEach(daysList, id: \.self) {
                        day in
                        WeatherDayView(dayOfWeek: day[0],
                                       imageName: day[1],
                                       temperature: Int(day[2])!)
                    }
                    
                     
                    
                }
                Spacer()
                Button {
                    isNight.toggle()
                }
                label : {ButtonView(buttonText: "Change Day and Time",
                                    backgroundColor: .white,
                                    textColor: .blue)
                }
                    Spacer()
            }
        }
        
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek : String
    var imageName : String
    var temperature: Int
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium
                             ))
                .foregroundColor(.white)
                
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text("\(temperature)°")
                .font(.system(size: 22, weight: .medium))
                .foregroundColor(.white)
            
        }
    }
}


struct BackgroundView: View {
    @Binding var isNight: Bool
    var topColor : Color
    var bottomColor : Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [ isNight ? .black: topColor,isNight ? .gray: bottomColor]), startPoint: .topLeading,
            endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
            .padding(.top, 10)
    }
}


struct MainWeatherView: View {
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
            
        }
    }
}
