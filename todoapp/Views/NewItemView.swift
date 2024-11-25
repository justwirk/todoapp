//
//  NewItemView.swift
//  todoapp
//
//  Created by Emre Yılmaz on 7.10.2024.
//

import SwiftUI

struct NewItemView: View {
    @Binding var newItemPresented: Bool
    @StateObject var vM = NewItemViewModel()
    
    var body: some View {
        VStack{
            Text("New Mission")
                .font(.title)
                .bold()
                .padding(.top, 100)
            Form{
                TextField("Title", text:$vM.title)
                DatePicker("Finish Date", selection: $vM.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                Button(action: {
                    if vM.canSave{
                        vM.save()
                        newItemPresented = false
                    }else{
                        vM.showAlert = true
                    }
                    }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundStyle(.primary)
                        Text("Save")
                            .foregroundStyle(.white)
                    }
                }) .frame(height: 50)
                    .padding(.horizontal)
                
            }
            .alert(isPresented: $vM.showAlert, content: {
                Alert(title: Text("Error"),
                      message: Text("Please check the data."))
            })
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true }, set: { _ in }))
}
