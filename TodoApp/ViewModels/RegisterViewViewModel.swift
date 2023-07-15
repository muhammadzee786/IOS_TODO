//
//  RegisterViewViewModel.swift
//  TodoApp
//
//  Created by Ozeito on 08/07/2023.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel: ObservableObject{
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func RegisterUser() {
            
            guard Validate() else {
                return
            }
            print(name, email)
            //register user
            Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
                
                if let error = error {
                    print("error is", error.localizedDescription)
                    return
                }
                
                guard let userId = result?.user.uid else {
                    return
            }
            
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord (id: String) {
        print("calll")
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("user")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func Validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty, !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            print("pass")
            errorMessage = "Please fill all fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else{
            print("email")
            errorMessage = "Please provide valid email."
            return false
        }
        
        guard password.count >= 6 else {
            print("len")
            return false
        }
        
        return true
    }
}
