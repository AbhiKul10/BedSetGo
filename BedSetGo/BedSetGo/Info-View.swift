//
//  Info-View.swift
//  SleepCalculatorApp
//
//  Created by Abhi Kulshrestha on 22/04/21.
//

import SwiftUI

struct Info_View: View {
    var phonenumber = "1800-599-0019"
    var body: some View {
        ZStack{
            //Color(.white).edgesIgnoringSafeArea(.all)
            VStack(){
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
                .offset(y: -130)
                
                
                
                    VStack{
                        
                        VStack{
                       
                        Button(action: {
                            if let url = NSURL(string: "tel://\(self.phonenumber)"),
                                UIApplication.shared.canOpenURL(url as URL) {
                                UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
                            }
                        }) {
                            Text("HELPLINE")
                                .frame(width: UIScreen.main.bounds.width-40, height: 50, alignment: .center)
                                .background(Color(.systemGreen))
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        }
                        ScrollView{
                        VStack(alignment: .leading, spacing: 15){
                            Text("MORE INFORMATION")
                                .font(.system(size: 25, weight: .bold))
                                
                            
                            Text("ABOUT SLEEP")
                                .font(.system(size: 20, weight: .bold))
                                
                            
                            Text("Sleep is a naturally recurring state of mind and body, characterized by altered consciousness, relatively inhibited sensory activity, reduced muscle activity and inhibition of nearly all voluntary muscles during rapid eye movement sleep, and reduced interactions with surroundings.")
                                
                            Button(action: {
                                if let url = URL(string: "https://www.nhlbi.nih.gov/health-topics/sleep-deprivation-and-deficiency")
                                    {
                                        UIApplication.shared.open(url)
                                    }
                                }){
                                    HStack{
                                        Image("infoo")
                                            .resizable().frame(width: 20, height: 20)
                                        Text("For more Info")
                                            .foregroundColor(.blue)
                                            }.padding(5)
                                        .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.blue, lineWidth: 1)
                                            )
                                                        
                                                    
                            }
                            
                            Text("What can you do?")
                                .font(.system(size: 20, weight: .bold))
                                
                            
                            Text("Sleep plays an important role in your physical health. For example, sleep is involved in healing and repair of your heart and blood vessels. Ongoing sleep deficiency is linked to an increased risk of heart disease, kidney disease, high blood pressure, diabetes, and stroke. Here are the ways you can follow for better sleep -")
                               
                            Button(action: {
                                if let url = URL(string: "https://www.wikihow.com/Sleep-Better")
                                    {
                                        UIApplication.shared.open(url)
                                    }
                                }){
                                    HStack{
                                        Image("infoo")
                                            .resizable().frame(width: 20, height: 20)
                                        Text("For more Info")
                                            .foregroundColor(.blue)
                                            }.padding(5)
                                        .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.blue, lineWidth: 1)
                                            )
                                                        
                                                    
                            }
                        }
                        .padding()
                        
                            
                        
                    }
                    //.frame(height: UIScreen.main.bounds.height/1.4)
                //.padding(.top)
                //.padding(.bottom)
                
                //.border(Color(.systemGreen))
                
                //.background(Color(.white))
               // .cornerRadius(20)
                //.border(Color(.systemGreen))
                
                
                }
                .frame(height: UIScreen.main.bounds.height/1.8)
                .offset(y: -100)
                
                
                
            
            }
            
        }
    }
    
}

struct Info_View_Previews: PreviewProvider {
    static var previews: some View {
        Info_View()
    }
}
