//
//  SplashScreenView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 13/11/2023.
//

import SwiftUI

struct SplashScreenView: View {
    
    let isDarkmode = UserDefaults.standard.bool(forKey: "isDarkModeEnabled")
    
    
    
    
    
    @State var stackOpacity = 1.0
    
    @State var rOffset = -300.0
    @State var ratOffset = -300.0
    @State var hatOffsetX = 0.0
    @State var hatOffsetY = 0.0
    @State var hatOpacity = 0.0
    @State var hatRotation = 0.0
    
    
    
    var body: some View {
        
        let rImage = isDarkmode ? "icon_r_yellow" : "icon_r_red"
        let hatImage = isDarkmode ? "icon_hat_yellow" : "icon_hat_red"
        let ratImage = "icon_rat_black"
        
        VStack{
            ZStack{
                Color(.black).ignoresSafeArea()
                    .onAppear{
                        withAnimation(.easeIn(duration: 0.3).delay(2.7)){
                        }
                    }
                ZStack{
                    Image(hatImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300)
                        .offset(x: hatOffsetX, y: hatOffsetY)
                        .rotationEffect(.degrees(hatRotation))
                        .opacity(hatOpacity)
                        .onAppear{
                            withAnimation(.easeOut(duration: 0.5).delay(0.7)){
                                hatOffsetY = -120.0
                                hatOffsetX = 60.0
                                hatOpacity = 1.0
                                hatRotation = 20.0
                            }
                        }
                    Image(rImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300)
                        .offset(x: rOffset)
                        .onAppear{
                            withAnimation(.easeOut(duration: 0.8)){
                                rOffset = 0
                            }
                            
                        }
                    Image(ratImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300)
                        .offset(x: ratOffset, y: -15)
                        .onAppear{
                            withAnimation(.easeOut(duration: 0.6).delay(0.4)){
                                ratOffset = -10
                            }
                        }
                }.offset(x: -20)
            }
            
        }
        .opacity(stackOpacity)
        .onAppear{
            withAnimation(.easeIn(duration: 0.4).delay(2.6)){
                    stackOpacity = 0.0
                }
            }
        
    }
}

#Preview {
    SplashScreenView()
}
