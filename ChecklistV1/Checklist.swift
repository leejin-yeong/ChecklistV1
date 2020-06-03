//
//  Checklist.swift
//  ChecklistV1
//
//  Created by Release on 2020/06/03.
//  Copyright © 2020 Jinyoung Lee. All rights reserved.
//

import Foundation

class Checklist: ObservableObject{
    @Published var checklistItems = [
           ChecklistItem(name: "Walk the dog",isChecked: false),
           ChecklistItem(name: "Brush my teeth", isChecked: false),
           ChecklistItem(name: "Learn iOS development", isChecked: true),
           ChecklistItem(name: "Soccer practice", isChecked: false),
           ChecklistItem(name: "Walk the dog", isChecked: true)
    ]
    
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
}
