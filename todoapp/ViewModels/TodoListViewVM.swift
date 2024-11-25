//
//  TodoListViewVM.swift
//  todoapp
//
//  Created by Emre Yılmaz on 14.10.2024.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class TodoListViewVM: ObservableObject{
    init(){}
    
    func toggleIsDone(item: ToDoListItem){
        
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("todoList")
            .document(item.id)
            .setData(itemCopy.asDictonary())
    }
}
