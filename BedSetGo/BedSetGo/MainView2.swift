//
//  MainView2.swift
//  SleepCalculatorApp
//
//  Created by Abhi Kulshrestha on 21/04/21.
//

import SwiftUI

struct MainView2: View {
    @State var selection : Int
    var body: some View {
        
        TabView(selection : $selection){
            MainScreen()
                .tabItem {
                    VStack {
                        Image(systemName: "waveform.path.ecg.rectangle.fill")
                            .imageScale(.large)
                        Text("Stats")
                    
                    }
            }.tag(0)
            CalculateSleep()
                .navigationBarHidden(true)
                
                .tabItem {
                    VStack {
                        Image(systemName: "bed.double.fill")
                            .imageScale(.large)
                        Text("Sleep")
                    
                    }
            }.tag(1)
            Info_View()
                .navigationBarHidden(true)
                .tabItem{
                    VStack{
                        Image(systemName: "heart.fill")
                            .imageScale(.large)
                        Text("Help")
                    }
                }.tag(2)
            
        }
    }
}

struct MainView2_Previews: PreviewProvider {
    static var previews: some View {
        MainView2(selection: 0)
    }
}

