//
//  RegisterView.swift
//  todoapp
//
//  Created by Emre Yılmaz on 7.10.2024.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var vM = RegisterViewViewModel()
    
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
                    
                    Section(header: Text("Registration Form")){
                        TextField("Your Name", text: $vM.name)
                            .autocorrectionDisabled()
                        TextField("Your E-mail", text: $vM.email)
                            .autocorrectionDisabled()
                            .autocapitalization(.none)
                        SecureField("Password", text: $vM.password)
                    }
                }
                .frame(height: 250)
                
                Button(action: {vM.register()}, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundStyle(.primary)
                        Text("Register")
                            .foregroundStyle(.white)
                    }
                }) .frame(height: 50)
                    .padding(.horizontal)
                    Spacer()
                
              
            }
        }
    }
}

#Preview {
    RegisterView()
}
