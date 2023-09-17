//
//  GeneratorView.swift
//  imageGeneratorApp
//
//  Created by Illia Lotfalian on 2023-08-08.
//

import SwiftUI

struct GeneratorView: View{
    @ObservedObject var viewModel: ViewModel
    var body: some View{
        VStack(alignment: .leading){
            Text("Generated Image")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
            VStack{
                Text("Time Spend: \(" ")" )
                AsyncImage(url: viewModel.image) { image in
                    image.resizable().aspectRatio(1, contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .background(Color.gray.opacity(0.2))
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .cornerRadius(20)
                .clipped()

            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .onAppear{
            viewModel.generateImage()
        }
    }
}

struct GeneratorView_Previews: PreviewProvider{
    static var previews: some View{
        GeneratorView(viewModel: .init(prompt: "Red Car", selectedStyle: .threeDRender))
    }
}
