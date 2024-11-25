//
//  NewItemViewModel.swift
//  todoapp
//
//  Created by Emre Yılmaz on 11.10.2024.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewModel: ObservableObject{
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init(){}
    
    func save(){
        guard canSave else{
            return 
        }
        
        guard let uId = Auth.auth().currentUser?.uid else{
            return
        }
        
        let newItemId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newItemId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createDate: Date().timeIntervalSince1970,
            isDone: false
        )
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todoList")
            .document(newItem.id)
            .setData(newItem.asDictonary())
        
    }
    
    var canSave : Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            return false
        }
        
        return true 
    }
}
