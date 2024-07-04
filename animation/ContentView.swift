//
//  ContentView.swift
//  animation
//
//  Created by 本田輝 on 2024/07/04.
//

import SwiftUI

struct ContentView: View {
    
    var width: CGFloat = UIScreen.main.bounds.height < 750 ? 130 : 230
    @State var artworkColor: [Color] = [.cyan,.cyan,.purple,.cyan,.purple,.purple,.cyan]
    @State var artworkColor2: [Color] = [.cyan,.purple,.purple,.cyan,.cyan,.cyan,.cyan]
    @State var artworkUIColor: [UIColor] = [.cyan,.cyan,.cyan,.cyan,.cyan,.cyan,.cyan,.cyan,.cyan,.cyan]
    @State var isConnecting: Bool = false
    
    var body: some View {
        
        Button {
            withAnimation {
                isConnecting.toggle()
            }
                    
        } label: {
            Image(systemName: "waveform.path")
                .font(.system(size: 65,weight: .medium))
                .frame(width: width ,height: width )
                .opacity(isConnecting ? 0 : 1)
                .background(
                    ZStack {
                        Circle()
                            .trim(from: isConnecting ? 0.125 : 0.3,to: isConnecting ? 0.625 : 0.5)
                            .stroke(
                                AngularGradient(colors: artworkColor, center: .center),
                                style: StrokeStyle(lineWidth: 11,lineCap: isConnecting ? .butt : .round,lineJoin: isConnecting ? .miter : .round)
                            )
                            .shadow(color: !isConnecting ? artworkColor.first! : .clear, radius: 10,x: 1,y: -4)
                        
                        Circle()
                            .trim(from: isConnecting ? 0.125 : 0.3,to: isConnecting ? 0.625 : 0.5)
                            .stroke(
                                AngularGradient(colors: artworkColor2, center: .center),
                                style: StrokeStyle(lineWidth: 11,lineCap: isConnecting ? .butt : .round,lineJoin: isConnecting ? .miter : .round)
                            )
                            .shadow(color: !isConnecting ? artworkColor2.last! : .clear, radius: 10,x: 1,y: -4)
                            .rotationEffect(Angle(degrees: 180))

                        Circle()
                            .stroke(
                                Color(.cyan)
                                    .opacity(0.01),
                                lineWidth: 11
                            )
                            .shadow(color: Color(.purple).opacity(isConnecting ? 0.04: 0), radius: 5,x: 1,y: -4)
                    }
                )
        }
        
//        MetalView()
//            .ignoresSafeArea()
    }
}
#Preview {
    ContentView()
}
