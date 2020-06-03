//
//  NewChecklistItemView.swift
//  ChecklistV1
//
//  Created by Release on 2020/06/03.
//  Copyright © 2020 Jinyoung Lee. All rights reserved.
//

import SwiftUI

struct NewChecklistItemView: View {
    var body: some View {
        VStack{
            Text("Add new item")
            Text("Enter item name")
            Button(action: {}){
                HStack{
                    Image(systemName: "plus.circle.fill")
                    Text("Add new item")
                }//End of HStack
            }//End of Button
            Text("Swipe down to cancel.")
        }//End of VStack
    }//End of body
}//End of View

struct NewChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewChecklistItemView()
    }
}
