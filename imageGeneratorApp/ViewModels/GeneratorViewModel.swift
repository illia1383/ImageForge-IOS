//
//  GeneratorViewModel.swift
//  imageGeneratorApp
//
//  Created by Illia Lotfalian on 2023-08-08.
//

import Foundation

extension GeneratorView{
    class ViewModel: ObservableObject{
        @Published var duration = 0
        @Published var image: URL?
        
        let prompt: String
        let  selectedStyle : ImageStyle
        
        private let OpenAIservice = OpenAIService()
        
        init(prompt: String, selectedStyle: ImageStyle) {

            self.prompt = prompt
            self.selectedStyle = selectedStyle
        }
        
        func generateImage(){
            let formattedPrompt = "\(selectedStyle.title) image of \(prompt)"

            
            Task{
                do{
                    let generatedImage = try await OpenAIservice.generateImage(prompt: formattedPrompt)
                    guard let ImageURLString = generatedImage.data.first?.url, let imageUrl = URL(string: ImageURLString) else{
                        print("Failed to generate image")
                        return
                    }
                    await MainActor.run{
                        self.image = imageUrl
                    }
                }catch{
                    print(error)
                }
            }
        }
        
    }

}
