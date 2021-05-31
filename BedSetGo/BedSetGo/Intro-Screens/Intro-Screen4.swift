//
//  Intro-Screen4.swift
//  SleepCalculatorApp
//
//  Created by Abhi Kulshrestha on 21/04/21.
//

import SwiftUI

struct Intro_Screen4: View {
    var body: some View {
        ZStack{
            Color(.systemGreen).edgesIgnoringSafeArea(.all)
            VStack{
            HStack{
                Circle().fill(Color.gray)
                    .frame(width: 10, height: 10)
                Circle().fill(Color.gray)
                    .frame(width: 10, height: 10)
                Circle().fill(Color.gray)
                    .frame(width: 10, height: 10)
                Circle().fill(Color.white)
                    .frame(width: 10, height: 10)
            }
                Spacer()
            VStack{
                VStack{
                Image("Intro-image4")
                    .resizable()
                    .frame(width: 300, height: 234, alignment: .center)
                    .padding(.bottom)
                
                    Text("Our App will help you to Relax, Sleep Better and Wake Up")
                        .foregroundColor(.white)
                        .font(.title3)
                        .frame(width: 300, alignment: .center)
                        .multilineTextAlignment(.center)
                }.offset(y: -80)
                
                HStack{
                    NavigationLink(destination: MainView2(selection: 0)){
                        Text("Continue")
                            .frame(width: 100, height: 50)
                            .background(Color.white)
                            .foregroundColor(Color(.systemGreen))
                            .font(.system(size: 18, weight: .heavy))
                            .cornerRadius(20)
                    }
                }
            }
                Spacer()
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct Intro_Screen4_Previews: PreviewProvider {
    static var previews: some View {
        Intro_Screen4()
    }
}
