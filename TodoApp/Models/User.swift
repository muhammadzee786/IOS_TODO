//
//  User.swift
//  TodoApp
//
//  Created by Ozeito on 08/07/2023.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
