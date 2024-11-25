//
//  ToDoListItemView.swift
//  todoapp
//
//  Created by Emre Yılmaz on 7.10.2024.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var vM = TodoListViewVM()
    let item: ToDoListItem
    var body: some View {
        HStack{
            VStack{
                Text(item.title)
                    .font(.title)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(Color(.secondaryLabel))
            }
            Spacer()
            Button{
                vM.toggleIsDone(item: item)
            }label:{
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(Color.blue)
            }
        }
    }
}

#Preview {
    ToDoListItemView(item: .init(
        id:"12345",
        title: "Baslik",
        dueDate: Date().timeIntervalSince1970,
        createDate: Date().timeIntervalSince1970,
        isDone: false
    ))
}
