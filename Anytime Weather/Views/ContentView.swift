//
//  ContentView.swift
//  Anytime Weather
//
//  Created by aku pintar indonesia on 05/04/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var city = ""
    
    var history = ["Surabaya", "Jakarta", "Surakarta", "Bandung", "Semarang", "Yogyakarta", "Medan", "Batam"]
    var searchSuffix = ["baya", "karta", "dung", "rang", "dan", "tam"]
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        
        NavigationView() {
            
            ZStack {
                
                Color.color6.edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    HStack {
                        
                        TextField("Enter city", text: self.$city)
                            .padding()
                        
                        Spacer()
                        
                        NavigationLink(destination: WeatherDetailView(city: self.city)) {
                            Image(systemName: "chevron.forward.circle.fill")
                        }.padding()
                        
                    }
                    .background(Color.white)
                    .cornerRadius(3.0)
                    
                    let isHistory = self.city.isEmpty
                    ForEach(isHistory ? self.history : self.searchSuffix, id: \.self) { city in
                        CityCell(city: city, isHistory: isHistory)
                    }
                    .cornerRadius(3.0)
                    .listRowBackground(Color.clear)
                    
                    Spacer()
                    
                }
                .navigationBarTitle("Anytime Weather")
                .padding()
            }
        }
        
    }
    
}

struct CityCell: View {
    
    var city: String
    var isHistory: Bool
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 10) {
            
            HStack(alignment: .center) {
                
                Image(systemName: self.isHistory ? "clock" : "magnifyingglass")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15, alignment: .center)
                
                Spacer().frame(width: 20)
                
                Text(self.city)
                    .foregroundColor(.white)
                    .font(.body)
                    .frame(height: 15)
                
                Spacer()
                
                Image(systemName: "arrow.up.backward")
                    .foregroundColor(.white)
                
            }
            
            Color.white.frame(height: 1)
            
        }.padding()
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
