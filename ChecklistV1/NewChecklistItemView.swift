//
//  NewChecklistItemView.swift
//  ChecklistV1
//
//  Created by Release on 2020/06/03.
//  Copyright © 2020 Jinyoung Lee. All rights reserved.
//

import SwiftUI

struct NewChecklistItemView: View {
    
    var checklist: Checklist
    @State var newItemName = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            Text("Add new item")
            Form{
               // Text("Enter item name")
                TextField("Enter new item name here",text: $newItemName)
                Button(action: {
                    let newChecklistItems = ChecklistItem(name: self.newItemName)
                    self.checklist.items.append(newChecklistItems)
                    self.checklist.printChecklistContents()
                    self.presentationMode.wrappedValue.dismiss()
                })
                {
                    HStack{
                        Image(systemName: "plus.circle.fill")
                        Text("Add new item")
                    }//End of HStack
                }//End of Button
                    .disabled(newItemName.count == 0)
            }//End of List
            Text("Swipe down to cancel.")
        }//End of VStack
        .onAppear(){
            print("NewChecklistView has appeared")
        }
        .onDisappear(){
            print("NewChecklistView has disappeared")
        }
    }//End of body
}//End of View

struct NewChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewChecklistItemView(checklist: Checklist())
    }
}
