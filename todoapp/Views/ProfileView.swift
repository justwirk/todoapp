//
//  ProfileView.swift
//  todoapp
//
//  Created by Emre Yılmaz on 7.10.2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var vM = ProfileViewVIewModel()
    
    init(){}
    
    var body: some View {
        NavigationView{
            VStack{
                
                if let user = vM.user{
                    profile(user: user)
                }else {
                        Text("Profile Loading...")
                }
                Button(action: {vM.logout()}, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundStyle(.primary)
                        Text("Exit")
                            .foregroundStyle(.white)
                    }
                })
                .frame(height: 50)
                .padding(.horizontal)
                Spacer()
                    
                }
                    .navigationTitle("Profile")
            }
            .onAppear{
                vM.FetchUser()
            }
        }
        
        @ViewBuilder
        func profile(user: User) -> some View{
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(Color.blue)
                .frame(width: 100, height: 100)
            
            VStack{
                HStack{
                    Text("Name:")
                    Text(user.name)
                }
                
                HStack{
                    Text("Email:")
                    Text(user.email)
                }
                
                HStack{
                    Text("Joined Date:")
                    Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                }
            }
        }
    }


#Preview {
    ProfileView()
}
