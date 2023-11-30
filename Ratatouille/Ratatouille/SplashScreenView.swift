//
//  SplashScreenView.swift
//  Ratatouille
//
//  Created by Øystein Engell on 13/11/2023.
//

import SwiftUI

struct SplashScreenView: View {
    
    
    @State var Roffset = -300.0
    @State var RatOffset = -300.0
    @State var HatOffsetX = 0.0
    @State var HatOffsetY = 0.0
    @State var hatOpacity = 0.0
    @State var hatRotation = 0.0
    
    var body: some View {
        
        VStack{
            ZStack{
                Color(.main).ignoresSafeArea()
                
                ZStack{
                    
                    Image("IconHat")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300)
                        .offset(x: HatOffsetX, y: HatOffsetY)
                        .rotationEffect(.degrees(hatRotation))
                        .opacity(hatOpacity)
                        .onAppear{
                            withAnimation(.easeOut(duration: 0.5).delay(0.7)){
                                HatOffsetY = -120.0
                                HatOffsetX = 55.0
                                hatOpacity = 100.0
                                hatRotation = 22.0
                            }
                            
                        }
                    Image("IconR")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300)
                        .offset(x: Roffset)
                        .onAppear{
                            withAnimation(.easeOut(duration: 0.8)){
                             Roffset = 0
                            }
                        }
                    Image("IconRat")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300)
                        .offset(x: RatOffset, y: -15)
                        .onAppear{
                            withAnimation(.easeOut(duration: 0.8).delay(0.3)){
                             RatOffset = -10
                            }
                            
                        }
                }.offset(x: -20)
            }
        }
      
    }
}

#Preview {
    SplashScreenView()
}
