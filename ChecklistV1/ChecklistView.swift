//
//  ContentView.swift
//  ChecklistV1
//
//  Created by Release on 2020/05/27.
//  Copyright © 2020 Jinyoung Lee. All rights reserved.
//

import SwiftUI



struct ChecklistView: View {
   
    @ObservedObject var checklist = Checklist()
    @State var newChecklistItemViewIsVisible = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(checklist.items){ //name in struct
                    /*
                    checklistItem in
                    RowView(checklistItem: checklistItem)*/
                    index in
                    RowView(checklistItem: self.$checklist.items[index])
                }//End of ForEach
                    .onDelete(perform: checklist.deleteListItem)
                    .onMove(perform: checklist.moveListItem)

            }//end of list
            .navigationBarItems(
                leading: Button(action: {self.newChecklistItemViewIsVisible = true}){
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add item")
                    }
                },
                trailing: EditButton())
            .navigationBarTitle("Checklist")
            .onAppear(){
                self.checklist.printChecklistContents()
            }//End of Navigation View
            .sheet(isPresented: $newChecklistItemViewIsVisible){
                //Text("New item screen coming soon!")
                NewChecklistItemView(checklist: self.checklist)
            }
        }
    }//End of body
    
//Methond

}//End of Content View

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}
