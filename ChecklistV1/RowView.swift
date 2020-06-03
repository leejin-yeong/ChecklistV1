//
//  RowView.swift
//  ChecklistV1
//
//  Created by Release on 2020/06/03.
//  Copyright © 2020 Jinyoung Lee. All rights reserved.
//

import SwiftUI

struct RowView: View {
    @State var checklistItem: ChecklistItem
        var body: some View {
            NavigationLink(destination: EditChecklistItemView()){
                HStack{
                    Text(checklistItem.name)
                    Spacer()
                    Text(checklistItem.isChecked ?  "☑️" : "⬛️")
                }//End of HStack
            }
        }
    }

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(checklistItem: ChecklistItem(name: "Sample item"))
    }
}
