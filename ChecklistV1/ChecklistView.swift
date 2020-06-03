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
    
    var body: some View {
        NavigationView{
            List{
                ForEach(checklist.checklistItems){ //name in struct
                    checklistItem in
                    HStack{
                        Text(checklistItem.name)
                        Spacer()//space
                        Text(checklistItem.isChecked ? "☑️" : "⬛️")
                    }
                    .background(Color.white) //for whole ro clickable
                    .onTapGesture {//checklistitem is defined in ForEach.
                        //print("The user tapped \(checklistItem.name).") //not print in app.
                        if let matchingIndex = self.checklist.checklistItems.firstIndex(where: { //if let : optional binding
                            //if not null, do it
                            $0.id == checklistItem.id }){
                            self.checklist.checklistItems[matchingIndex].isChecked.toggle()//toggle == change
                        }
                        self.checklist.printChecklistContents()
                    }
                }//End of ForEach
                    .onDelete(perform: checklist.deleteListItem)
                    .onMove(perform: checklist.moveListItem)

            }//end of list
            .navigationBarItems(trailing: EditButton())
            .navigationBarTitle("Checklist")
            .onAppear(){
                self.checklist.printChecklistContents()
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
