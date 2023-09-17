//
//  HeaderView.swift
//  imageGeneratorApp
//
//  Created by Illia Lotfalian on 2023-08-31.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    
    var body: some View {
        VStack{
            ZStack{
                //Header
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(background)
                    .rotationEffect(Angle(degrees: angle))
                VStack{
                    Text(title)
                        .font(.largeTitle)
                        .bold()
                    Text(subtitle)
                        .font(.system(size: 30))
                        .foregroundColor(Color.black)
                }
                .padding(.top, 80)
            }
            .frame(width: UIScreen.main.bounds.width * 3, height : 350)
            .offset(y: -150)
            
            
            
            // Create Account
            
            Spacer()
                
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title",
                   subtitle: "subtitle",
                   angle: 15,
                   background: .yellow)
    }
}
