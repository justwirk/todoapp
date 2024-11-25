//
//  LoginView.swift
//  todoapp
//
//  Created by Emre Yılmaz on 7.10.2024.
//

import SwiftUI

struct LoginView: View {

    
    @StateObject var vM = LoginViewViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                ZStack{
                    Image("Logo2")
                        .resizable()
                        .frame(width: 150, height: 150)
                        
                }.padding(.top,100)
                
                Form{
                    if !vM.errorMessage.isEmpty{
                        Text(vM.errorMessage)
                            .foregroundStyle(.red)
                    }
                    TextField("Email Adress", text: $vM.email)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Password", text: $vM.password)
                }.frame(height: 220)
                Button(action: {vM.login()}, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundStyle(.primary)
                        Text("Login")
                            .foregroundStyle(.white)
                    }
                })
                .frame(height: 50)
                .padding(.horizontal)
                Spacer()
                
                VStack{
                    Text("Don't you have an account?" )
                    NavigationLink("New account create", destination: RegisterView())
                }.padding(.bottom, 50)
                
            }
        }
    }
}

#Preview {
    LoginView()
}
