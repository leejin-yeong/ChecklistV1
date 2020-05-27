//
//  ContentView.swift
//  ChecklistV1
//
//  Created by Release on 2020/05/27.
//  Copyright © 2020 Jinyoung Lee. All rights reserved.
//

import SwiftUI

struct ChecklistItem{
    var name: String
    var isChecked: Bool = false
}

struct ContentView: View {
    @State var checklistItems = [
        ChecklistItem(name: "Walk the dog"),
        ChecklistItem(name: "Brush my teeth"),
        ChecklistItem(name: "Learn iOS development", isChecked: true),
        ChecklistItem(name: "Soccer practice"),
        ChecklistItem(name: "Eat ice cream", isChecked: true)
    ]
    var body: some View {
        NavigationView{
            List{
                ForEach(checklistItems, id: \.self.name){ //name in struct
                    checklistItems in
                    HStack{
                        Text(checklistItems.name)
                        Spacer()//space
                        if checklistItems.isChecked {
                            Text("☑️")
                        }
                        else{
                            Text("⬛️")
                        }
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
        ContentView()
    }
}
