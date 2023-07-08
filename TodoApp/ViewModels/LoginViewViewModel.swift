//
//  LoginViewViewModel.swift
//  TodoApp
//
//  Created by Ozeito on 08/07/2023.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel : ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func Login(){
        errorMessage = ""
        
        guard Validate() else {
            return
        }
        
        // login
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    private func Validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please fill all fields"
            return false
        }
        
        guard !email.contains("@") && !email.contains(".") else{
            errorMessage = "Please provide valid email."
            
            return false
        }
        
        return true
    }
}
