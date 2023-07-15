//
//  NewItemView.swift
//  TodoApp
//
//  Created by Ozeito on 08/07/2023.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var newItemViewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
            
            Form{
                TextField("title", text: $newItemViewModel.title)
                
                DatePicker("Due Date", selection: $newItemViewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                TLButton(title: "Save", background: .pink) {
                    if(newItemViewModel.canSave) {
                        newItemViewModel.save()
                        newItemPresented = false
                    } else {
                        newItemViewModel.showAlert = true
                    }
                }
                .alert(isPresented: $newItemViewModel.showAlert) {
                    Alert(title: Text("Error"), message: Text("Fill all fields"))
                }
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
