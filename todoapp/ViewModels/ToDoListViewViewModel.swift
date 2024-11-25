//
//  ToDoListViewViewModel.swift
//  todoapp
//
//  Created by Emre Yılmaz on 11.10.2024.
//
import FirebaseFirestore
import Foundation

class ToDoListViewViewModel: ObservableObject{
    
    @Published var showNewItemView = false
    
    private let userID: String
    
    init(userID: String){
        self.userID = userID
    }
    
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userID)
            .collection("todoList")
            .document(id)
            .delete()
    }
}
