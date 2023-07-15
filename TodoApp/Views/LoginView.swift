//
//  LoginView.swift
//  TodoApp
//
//  Created by Ozeito on 08/07/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        
        VStack{
            //header
            HeaderView(title: "To Do List", subTitle: "Get things done", angle: 15, background: .pink, offSet: -95)
            
            //form
            Form{
                
                VStack{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        
                    TLButton(title: "Log in", background: .gray) {
                        viewModel.Login()
                    }

                }
            }
            //create account
            
            VStack{
                Text("New Around here")
                
                NavigationLink("Create an account", destination: RegisterView())
            }
            .padding(.bottom, 40)
            .padding(.top, 20)
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
