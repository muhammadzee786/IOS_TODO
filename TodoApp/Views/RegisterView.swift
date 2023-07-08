//
//  RegisterView.swift
//  TodoApp
//
//  Created by Ozeito on 08/07/2023.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var registerViewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack{
            //header
            HeaderView(title: "register", subTitle: "Start organizing todos", angle: -15, background: .orange, offSet: -110)
            //form
            Form{
                VStack{
                    TextField("Full Name", text: $registerViewModel.name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Email Address", text: $registerViewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    SecureField("password", text: $registerViewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TLButton(title: "Register", background: .orange) {
                        registerViewModel.RegisterUser()
                    }
                }
            }
            
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
