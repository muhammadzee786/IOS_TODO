//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Ozeito on 08/07/2023.
//

import FirebaseCore
import SwiftUI

@main
struct TodoAppApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
