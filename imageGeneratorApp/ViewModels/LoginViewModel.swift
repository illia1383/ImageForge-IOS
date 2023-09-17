//
//  LoginViewModel.swift
//  imageGeneratorApp
//
//  Created by Illia Lotfalian on 2023-09-01.
//

import Foundation
import FirebaseAuth
class LoginViewViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMesssage = ""
    init() {}
    
    func login(){
        guard validate() else{
            return 
        }
        //try to log user in
        
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    private func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            
            errorMesssage = "Please Fill in all fields"
            return false
        }
        // constrains on pass and email
        
        guard email.contains("@") && email.contains(".") else {
            errorMesssage = "Please enter a valid email"
        
            return false
        }
        return true
    }
}
