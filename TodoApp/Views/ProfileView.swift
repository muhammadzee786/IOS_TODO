//
//  ProfileView.swift
//  TodoApp
//
//  Created by Ozeito on 08/07/2023.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var profileView = ProfileViewViewModel()
    
    var body: some View {
        NavigationView{
            Text("")
            .navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
