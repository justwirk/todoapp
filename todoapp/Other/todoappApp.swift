//
//  todoappApp.swift
//  todoapp
//
//  Created by Emre Yılmaz on 7.10.2024.
//
import FirebaseCore
import SwiftUI

@main
struct todoappApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
