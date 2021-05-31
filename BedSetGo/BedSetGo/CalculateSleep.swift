//
//  CalculateSleep.swift
//  SleepCalculatorApp
//
//  Created by Abhi Kulshrestha on 21/04/21.
//

import SwiftUI

import EventKit
import EventKitUI
//import eventStore

struct CalculateSleep: View {
    @State private var wakeup = defaultwakeuptime
    @State private var sleepamount = 8.0
    @State private var workamount = 0
    @State private var coffeeamount = 0
   
    @State private var alerttitle = ""
    @State private var alertmessage = ""
    @State private var showingalert = false
   
    
    var body: some View {
        
        ZStack{
            Color(.white).edgesIgnoringSafeArea(.all)
            VStack{
                HStack(alignment: .top){
                    
                    VStack(alignment: .center, spacing: 10){
                    
                        Image("Intro-image1")
                            .resizable()
                            .frame(width: 200, height: 160, alignment: .center)
                            .offset(x:UIScreen.main.bounds.width/13,y:80)
//
                        
                    }
                    .padding(.leading, UIScreen.main.bounds.width / 5)
                    Spacer()
                
               
            }
                .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 100)
            //.padding()
                .padding(.bottom,130)
                .background(Color(.systemGreen))
                .offset(y: -20)
                
                
                
                Form{
                    VStack(alignment: .leading, spacing:0){
                        Text("When do you want to wakeup?")
                        .font(.headline)
                    
                        DatePicker("Please Enter the time", selection: $wakeup, displayedComponents : .hourAndMinute)
                            .labelsHidden()
                            .datePickerStyle(WheelDatePickerStyle())
                    }
                    
                 
                    
                    VStack(alignment: .leading, spacing:0){
                        Text("Desired Amount of Sleep")
                        .font(.headline)
                    
                        Stepper(value: $sleepamount, in : 4...12, step : 0.25){
                        Text("\(sleepamount, specifier: "%g") hours")
                        }
                    }
                    VStack(alignment: .leading, spacing:0){
                            Text("Daily Work amount")
                        .font(.headline)
                    
                        Stepper(value : $workamount, in : 0...20){
                            if workamount == 0{
                            Text("0 hrs")
                            }
                            else{
                                Text("\(workamount) hrs")
                            }
                        }
                    }
                    VStack(alignment: .leading, spacing:0){
                            Text("Daily coffee intake")
                        .font(.headline)
                    
                        Stepper(value : $coffeeamount, in : 0...20){
                            if coffeeamount == 0{
                            Text("0 cup")
                            }
                            else{
                                Text("\(coffeeamount) cups")
                            }
                        }
                    }
                    
                    Button(action : {
                        calculateBedTime()
                    }){
                        Text("CALCULATE")
                            .frame(width: 340, height: 50)
                            .background(Color(.systemGreen))
                            .foregroundColor(Color(.white))
                            .font(.system(size: 18, weight: .heavy))
                            .cornerRadius(20)
                            
                        
                        
                    }.padding(.top)
                    .padding(.trailing)
                    .padding(.bottom)
                }
                .frame(height: UIScreen.main.bounds.height/1.4)
                //.padding(.top)
                //.padding(.bottom)
                .offset(y:-30)
                //.border(Color(.systemGreen))
                
                //.background(Color(.white))
               // .cornerRadius(20)
                //.border(Color(.systemGreen))
                
                
                
                
                
            
            }.alert(isPresented: $showingalert){
                Alert(title: Text(alerttitle), message: Text(alertmessage), dismissButton: .default(Text("OK")))
            }
        }
            
//            .navigationBarTitle("Sleep Calculator")
//            .navigationBarItems(trailing:
//                                    Button(action : calculateBedTime){
//                                        Text("Calculate")
//                                    }
//
//            )
//            .alert(isPresented: $showingalert){
//                Alert(title: Text(alerttitle), message: Text(alertmessage), dismissButton: .default(Text("OK")))
//            }
        
        
        }
    
    static var defaultwakeuptime : Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    func calculateBedTime(){
        let model = SleepCalculatorApp_final() //instance property
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeup)
        
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        do{
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepamount, Work: Double(workamount)) //predicts target value
           
            
            let sleepTime = wakeup - prediction.actualSleep
    
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            
            let some = formatter.string(from: sleepTime)
            //let some1 = String(prediction2.SleepTime)
            alertmessage = some
            alerttitle = "Your ideal BedTime is : "
            
        } catch{
            alerttitle = "Error Ocurred"
            alertmessage = "An error occured while calculating the bedtime"
        }
        showingalert = true
        
    }
    
}


struct CalculateSleep_Previews: PreviewProvider {
    static var previews: some View {
        CalculateSleep()
    }
}
