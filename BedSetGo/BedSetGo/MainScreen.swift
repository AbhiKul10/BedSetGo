//
//  MainScreen.swift
//  SleepCalculatorApp
//
//  Created by Abhi Kulshrestha on 21/04/21.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        Home().navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}

struct Home : View {
    @State var index = 0
    var body: some View{
        VStack{
            HStack{
                Text("STATISTICS")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color(.systemGreen))
                    Spacer(minLength: 0)
                }
            .padding(.horizontal) // Tab View...
            HStack(spacing: 0){
                Text("Day")
                    .foregroundColor(self.index == 0 ? .white : Color(.systemGreen).opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical,10)
                    .padding(.horizontal,35)
                    .background(Color(.systemGreen).opacity(self.index == 0 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default){
                            self.index = 0
                        }
                    }
                Spacer(minLength: 0)
                Text("Week")
                    .foregroundColor(self.index == 1 ? .white : Color(.systemGreen).opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical,10)
                    .padding(.horizontal,35)
                    .background(Color(.systemGreen).opacity(self.index == 1 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default){
                            self.index = 1
                        }
                    }
                
                Spacer(minLength: 0)
                Text("Month")
                    .foregroundColor(self.index == 2 ? .white : Color(.systemGreen).opacity(0.7))
                    .fontWeight(.bold) .padding(.vertical,10)
                    .padding(.horizontal,35)
                    .background(Color(.systemGreen).opacity(self.index == 2 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default){
                            self.index = 2
                        }
                    }
            }.background(Color.black.opacity(0.06))
            .clipShape(Capsule())
            .padding(.horizontal)
            .padding(.top, 25)
            
            TabView(selection : self.$index){
                GridView(fitness_Data: fit_Data)
                    .tag(0)
                
                GridView(fitness_Data: week_Fit_Data)
                    .tag(1)
                
                GridView(fitness_Data: monthly_Fit_Data)
                    .tag(2)
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            Spacer()
        }.padding(.top)
        .navigationBarBackButtonHidden(true)

    }
    }
                
                 

    struct GridView : View {
        var fitness_Data : [Fitness]
        var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
        var body: some View{
            LazyVGrid(columns: columns, spacing: 30){
                ForEach(fitness_Data){fitness in
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){
                        VStack(alignment: .leading, spacing: 20) {
                                Text(fitness.title)
                                    .foregroundColor(.white)
                            Text(fitness.data)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.top,10)
                            HStack{
                                Spacer(minLength: 0)
                                
                        Text(fitness.suggest)
                            .foregroundColor(.white)
                    }
                        }
                        .padding()
                        .background(Color(.systemGreen))
                        .cornerRadius(20)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                        
                        Image(fitness.image)
                            .renderingMode(.template)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.white.opacity(0.12))
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 25)
        }
    }
                




struct Fitness : Identifiable {
    var id : Int
    var title : String
    var image : String
    var data: String
    var suggest : String
}


var fit_Data =
    [
        Fitness(id: 0, title: "Heart Rate", image: "heart", data: "116 bpm", suggest: "80-120 Healthy"),
        Fitness(id: 1, title: "Sleep", image: "sleep", data: "7h 58m", suggest: "Deep Sleep 5h 13m"),
        Fitness(id: 2, title: "Energy Burn", image: "energy", data: "639 kcal", suggest: "Daily Goal 900 kcal"),
        Fitness(id: 3, title: "Steps", image: "steps", data: "12,561", suggest: "Daily Goal 20,000 Steps"),
        Fitness(id: 4, title: "Running", image: "running", data: "4.5 km", suggest: "Daily Goal 10 km"),
        Fitness(id: 5, title: "Cycling", image: "cycle", data: "12.9 km", suggest: "Daily Goal 20 km"),
    ]

var week_Fit_Data =
    [
        Fitness(id: 0, title: "Heart Rate", image: "heart", data: "83 bpm", suggest: "80-120 Healthy"),
        Fitness(id: 1, title: "Sleep", image: "sleep", data: "46h 53m", suggest: "Deep Sleep 26h 13m"),
        Fitness(id: 2, title: "Energy Burn", image: "energy", data: "4,082 kcal", suggest: "Weekly Goal 4,800 kcal"),
        Fitness(id: 3, title: "Steps", image: "steps", data: "14,3251", suggest: "Weekly Goal 25,0000 Steps"),
        Fitness(id: 4, title: "Running", image: "running", data: "39.8 km", suggest: "Weekly Goal 70 km"),
        Fitness(id: 5, title: "Cycling", image: "cycle", data: "89.7 km", suggest: "Weekly Goal 125 km"),
    ]
var monthly_Fit_Data =
    [
        Fitness(id: 0, title: "Heart Rate", image: "heart", data: "88 bpm", suggest: "80-120 Healthy"),
        Fitness(id: 1, title: "Sleep", image: "sleep", data: "NA", suggest: "Deep Sleep 26h 13m"),
        Fitness(id: 2, title: "Energy Burn", image: "energy", data: "NA", suggest: "Weekly Goal 4,800 kcal"),
        Fitness(id: 3, title: "Steps", image: "steps", data: "NA", suggest: "Weekly Goal 25,0000 Steps"),
        Fitness(id: 4, title: "Running", image: "running", data: "NA", suggest: "Weekly Goal 70 km"),
        Fitness(id: 5, title: "Cycling", image: "cycle", data: "NA", suggest: "Weekly Goal 125 km"),
    ]

//var monthly_Fit_Data =
//    [
//        Fitness(id: 0, title: "Heart Rate", image: "heart", data: "88 bpm", suggest: "80-120 Healthy"),
//        Fitness(id: 1, title: "Sleep", image: "sleep", data: "175h 58m", suggest: "Deep Sleep 26h 13m"),
//        Fitness(id: 2, title: "Energy Burn", image: "energy", data: "16,432 kcal", suggest: "Weekly Goal 4,800 kcal"),
//        Fitness(id: 3, title: "Steps", image: "steps", data: "6,58,345", suggest: "Weekly Goal 25,0000 Steps"),
//        Fitness(id: 4, title: "Running", image: "running", data: "169.6 km", suggest: "Weekly Goal 70 km"),
//        Fitness(id: 5, title: "Cycling", image: "cycle", data: "372.8 km", suggest: "Weekly Goal 125 km"),
//    ]
