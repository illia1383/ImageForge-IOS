//
//  LoginView.swift
//  imageGeneratorApp
//
//  Created by Illia Lotfalian on 2023-08-31.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationView {
            VStack{
                //Header
                HeaderView(title: "Generate Your Creativity", subtitle: "", angle: 15, background: .yellow)
              
                
                //Login Form
                //if its not empty it will throw the error msg becuase there was an issue with the login and password
                
                
                Form{
                    
                    if  !viewModel.errorMesssage.isEmpty {
                        Text(viewModel.errorMesssage)
                            .foregroundColor(Color.red)
                    }
                    TextField("Email Adress", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    AIButton(title: "Login", background: .black){
                        viewModel.login() 
                    }
                    .padding()
                }
                .offset(y: -50)
                //Create Account
                VStack{
                    Text("New Here?")
                    
                    NavigationLink("Register",destination: RegisterView())
                }
                .padding(.bottom,50)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
