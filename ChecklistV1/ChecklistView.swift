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
                    checklistItem in
                    HStack{
                        Text(checklistItem.name)
                        Spacer()//space
                        Text(checklistItem.isChecked ? "☑️" : "⬛️")
                    }
                    .background(Color.white) //for whole ro clickable
                    .onTapGesture {//checklistitem is defined in ForEach.
                        //print("The user tapped \(checklistItem.name).") //not print in app.
                        if let matchingIndex = self.checklist.items.firstIndex(where: { //if let : optional binding
                            //if not null, do it
                            $0.id == checklistItem.id }){
                            self.checklist.items[matchingIndex].isChecked.toggle()//toggle == change
                        }
                        self.checklist.printChecklistContents()
                    }
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
         /*   .onAppear(){
                self.checklist.printChecklistContents()
            }//End of Navigation View
                .sheet(isPresented: $newChecklistItemViewIsVisible){
                    Text("New item screen coming soon!")
            }*/
        }
    }//End of body
    
//Methond

}//End of Content View

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}
