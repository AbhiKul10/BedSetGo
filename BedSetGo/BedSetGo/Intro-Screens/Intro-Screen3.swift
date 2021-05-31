//
//  Intro-Screen3.swift
//  SleepCalculatorApp
//
//  Created by Abhi Kulshrestha on 21/04/21.
//

import SwiftUI

struct Intro_Screen3: View {
    var body: some View {
        ZStack{
            Color(.systemGreen).edgesIgnoringSafeArea(.all)
            VStack{
            HStack{
                Circle().fill(Color.gray)
                    .frame(width: 10, height: 10)
                Circle().fill(Color.gray)
                    .frame(width: 10, height: 10)
                Circle().fill(Color.white)
                    .frame(width: 10, height: 10)
                Circle().fill(Color.gray)
                    .frame(width: 10, height: 10)
            }
                Spacer()
            VStack{
                VStack{
                Image("Intro-image3")
                    .resizable()
                    .frame(width: 300, height: 257, alignment: .center)
                    .padding(.bottom)
                    Text("Sleep is one of the three pillars of a healthy lifestyle. Healthy sleep improves your health and quality of life")
                        .foregroundColor(.white)
                        .font(.title3)
                        .frame(width: 300, alignment: .center)
                        .multilineTextAlignment(.center)
                
                }
                .offset(y: -80)
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
                            NavigationLink(destination: Intro_Screen4()){
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

struct Intro_Screen3_Previews: PreviewProvider {
    static var previews: some View {
        Intro_Screen3()
    }
}
