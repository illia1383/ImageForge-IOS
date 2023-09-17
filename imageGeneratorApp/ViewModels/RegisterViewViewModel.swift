//
//  RegisterViewViewModel.swift
//  imageGeneratorApp
//
//  Created by Illia Lotfalian on 2023-09-04.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class RegisterViewViewModel: ObservableObject{
    @Published var name = ""
    @Published var password = ""
    @Published var email = ""
    
    init(){}
    
    func register(){
        guard validate() else{
            return
        }
        Auth.auth().createUser(withEmail: email, password: password){
            [weak self] result, error in guard let userId = result?.user.uid else{
                return
            }
            self?.inserUserRecord(id: userId)
        }
    }
    private func inserUserRecord(id:String){
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary()) //what we put in our data base 
    }
    func validate() -> Bool{
        guard  !name.trimmingCharacters(in: .whitespaces).isEmpty,
            !email.trimmingCharacters(in: .whitespaces).isEmpty,
               !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        guard email.contains("@") && email.contains(".") else{
            return false
        }
        guard password.count >= 6 else{
            return false;
        }
        return true
    }
}
