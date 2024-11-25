//
//  ToDoListView.swift
//  todoapp
//
//  Created by Emre Yılmaz on 7.10.2024.
//

import SwiftUI
import FirebaseFirestore

struct ToDoListView: View {
    
    @StateObject var vM : ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userID: String){
        self._items = FirestoreQuery(collectionPath: "users/\(userID)/todoList")
        self._vM = StateObject(wrappedValue: ToDoListViewViewModel(userID: userID))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items){ item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button("Delete"){
                                vM.delete(id: item.id)
                            }
                            .background(Color.red)
                        }
                }
            }
            .navigationTitle("Missions")
            .toolbar{
                Button{
                    vM.showNewItemView = true
                }label:{
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $vM.showNewItemView, content: {
                NewItemView(newItemPresented: $vM.showNewItemView)
            })
        }
    }
}

#Preview {
    ToDoListView(userID: "wdewtgwHejWVy04mJM9oLljlMwY2")
}
