//
//  Intro-Screen2.swift
//  SleepCalculatorApp
//
//  Created by Abhi Kulshrestha on 21/04/21.
//

import SwiftUI

struct Intro_Screen2: View {
    var body: some View {
        
            ZStack{
                Color(.systemGreen).edgesIgnoringSafeArea(.all)
                VStack{
                HStack{
                    Circle().fill(Color.gray)
                        .frame(width: 10, height: 10)
                    Circle().fill(Color.white)
                        .frame(width: 10, height: 10)
                    Circle().fill(Color.gray)
                        .frame(width: 10, height: 10)
                    Circle().fill(Color.gray)
                        .frame(width: 10, height: 10)
                }
                    Spacer()
                VStack{
                    VStack{
                    Image("Intro-image2")
                        .resizable()
                        .frame(width: 300, height: 210, alignment: .center)
                        .padding(.bottom)
                        Text("Getting Enough sleep can be just as important as working out")
                            .foregroundColor(.white)
                            .font(.title3)
                            .frame(width: 300, alignment: .center)
                            .multilineTextAlignment(.center)
                        
                    }.offset(y: -80)
                    
                    
                    HStack{
                        HStack{
                            NavigationLink(destination: MainView2(selection: 0)){
                                Text("SKIP")
                                    .frame(width: 100, height: 50)
                                    .background(Color.white)
                                    .foregroundColor(Color(.systemGreen))
                                    .font(.system(size: 18, weight: .heavy))
                                    .cornerRadius(20)
                            }
                                .padding(.trailing, 30)
                            HStack{
                                NavigationLink(destination: Intro_Screen3()){
                                    Text("NEXT")
                                        .frame(width: 100, height: 50)
                                        .background(Color.white)
                                        .foregroundColor(Color(.systemGreen))
                                        .font(.system(size: 18, weight: .heavy))
                                        .cornerRadius(20)
                                }
                            
                                    .padding(.leading, 30)
                            }
                            
                        }
                    }
                    
                }
                    Spacer()
                }
            
        }.navigationBarBackButtonHidden(true)
    }
}

struct Intro_Screen2_Previews: PreviewProvider {
    static var previews: some View {
        Intro_Screen2()
    }
}
