//
//  User.swift
//  todoapp
//
//  Created by Emre Yılmaz on 7.10.2024.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
