//
//  ContentView.swift
//  ChecklistV1
//
//  Created by Release on 2020/05/27.
//  Copyright © 2020 Jinyoung Lee. All rights reserved.
//

import SwiftUI



struct ChecklistView: View {
    @State var checklistItems = [
        ChecklistItem(name: "Walk the dog",isChecked: false),
        ChecklistItem(name: "Brush my teeth", isChecked: false),
        ChecklistItem(name: "Learn iOS development", isChecked: true),
        ChecklistItem(name: "Soccer practice", isChecked: false),
        ChecklistItem(name: "Walk the dog", isChecked: true)
    ]
    var body: some View {
        NavigationView{
            List{
                ForEach(checklistItems){ //name in struct
                    checklistItem in
                    HStack{
                        Text(checklistItem.name)
                        Spacer()//space
                        Text(checklistItem.isChecked ? "☑️" : "⬛️")
                    }
                    .background(Color.white) //for whole ro clickable
                    .onTapGesture {//checklistitem is defined in ForEach.
                        //print("The user tapped \(checklistItem.name).") //not print in app.
                        if let matchingIndex = self.checklistItems.firstIndex(where: { //if let : optional binding
                            //if not null, do it
                            $0.id == checklistItem.id }){
                            self.checklistItems[matchingIndex].isChecked.toggle()//toggle == change
                        }
                        self.printChecklistContents()
                    }
                }//End of ForEach
                .onDelete(perform: deleteListItem)
                .onMove(perform: moveListItem)

            }//end of list
            .navigationBarItems(trailing: EditButton())
            .navigationBarTitle("Checklist")
            .onAppear(){
                self.printChecklistContents()
            }
        }
    }//End of body
    
//Methond
    func printChecklistContents(){
        for item in checklistItems{
            print(item)
        }
    }
    
    func deleteListItem(whichElement: IndexSet){
        checklistItems.remove(atOffsets: whichElement)
        printChecklistContents()
    }
    func moveListItem(whichElement: IndexSet, destination: Int){
        checklistItems.move(fromOffsets: whichElement, toOffset: destination)
        printChecklistContents()
    }
}//End of Content View

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}
