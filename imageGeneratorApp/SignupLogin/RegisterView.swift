//
//  RegisterView.swift
//  imageGeneratorApp
//
//  Created by Illia Lotfalian on 2023-08-31.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        VStack{
            HeaderView(title: "Register", subtitle: "Start Generating", angle: -15, background: .yellow)
            
            Form{
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                AIButton(
                    title: "Create account",
                    background: .black
                ){
                    viewModel.register() // attempt registeration
                }
                
                .padding()
            }
            .offset(y: -50)
            
            Spacer()

            
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
