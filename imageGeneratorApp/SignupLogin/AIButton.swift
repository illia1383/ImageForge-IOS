//
//  AIButton.swift
//  imageGeneratorApp
//
//  Created by Illia Lotfalian on 2023-09-01.
//

import SwiftUI

struct AIButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

struct AIButton_Previews: PreviewProvider {
    static var previews: some View {
        AIButton(title:"Value", background: .yellow){
            //action
        }
    }
}
