//
//  ToDoListItemsView.swift
//  TodoApp
//
//  Created by Ozeito on 08/07/2023.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var todoListView = ToDoListViewViewModel()
    @FirestoreQuery var items: [ToDoListItem]
    
//    private let userId: String
    
    init(userId: String){
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
//        self.userId = userId
    }
    
    var body: some View {
        NavigationView {
            VStack{
                List (items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                todoListView.delete(id: item.id)
                            }
                            .foregroundColor(Color.red)
                        }
                }
                Text("testing")
            }
            
            .navigationTitle("To Do List")
            .toolbar {
                Button{
                    todoListView.showingNewItem = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $todoListView.showingNewItem) {
                NewItemView(newItemPresented: $todoListView.showingNewItem)
            }
        }
    }
}

struct ToDoListItemsView_Previews: PreviewProvider {

    static var previews: some View {
        ToDoListView(userId: "Grhzx757gQUDSSmZ1cRrC6Jd1Bl2")
    }
}
