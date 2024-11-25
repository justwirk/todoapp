//
//  RegisterViewViewModel.swift
//  todoapp
//
//  Created by Emre Yılmaz on 10.10.2024.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel: ObservableObject {
        
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    func register(){
        guard validate() else{
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result,
            error in guard let userId = result?.user.uid else{
                return
            }
            
            self?.saveUser(id: userId)
            
        }
    }
    
    private func saveUser(id: String){
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictonary())
    }
    
    
    private func validate() ->  Bool{
       
        errorMessage = ""
        
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
                errorMessage = "please fill all fields"
                return false
        }
        
        guard email.contains("@") && email.contains(".") else{
                errorMessage = "Please enter a valid email."
            return false
        }
        
        guard password.count >= 8 else{
            errorMessage = "Password must be at least 8 characters long."
            return false
        }
        
        return true
    }
}
