//
//  EditChecklistItemView.swift
//  ChecklistV1
//
//  Created by Release on 2020/06/03.
//  Copyright © 2020 Jinyoung Lee. All rights reserved.
//

import SwiftUI

struct EditChecklistItemView: View {
    
    @Binding var checklistItem: ChecklistItem
    
    var body: some View {
        Form{
            TextField("Name", text: $checklistItem.name)
            Toggle("Completed",isOn: $checklistItem.isChecked)
        }//End of Form
        .onAppear(){
            print("EditChecklistView has appeared")
        }
        .onDisappear(){
            print("EditChecklistView has disappeared")
        }
    }//End of body
}//End of struct

struct EditChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditChecklistItemView(checklistItem: .constant(ChecklistItem(name: "Sample item")))
    }
}
