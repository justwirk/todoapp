//
//  MainView.swift
//  todoapp
//
//  Created by Emre Yılmaz on 7.10.2024.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var vM = MainViewViewModel()
    
    var body: some View {
        if vM.isSignedIn, !vM.currentUserId.isEmpty {
            accountView
        }else{
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView{
            ToDoListView(userID: vM.currentUserId)
                .tabItem{
                    Label("Missions", systemImage: "house")
                }
            ProfileView().tabItem{Label("Profile", systemImage: "person.circle")}
        }
    }
    
}

#Preview {
    MainView()
}
