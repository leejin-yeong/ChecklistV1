//
//  ContentView.swift
//  ChecklistV1
//
//  Created by Release on 2020/05/27.
//  Copyright © 2020 Jinyoung Lee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var checklistItems = ["Walk the dog", "Brush my teeth","Learn iOS development", "Soccer practice","Eat ice cream"]
    var body: some View {
        NavigationView{
            List{
                ForEach(checklistItems, id: \.self){
                    item in Text(item)
                        .onTapGesture {
                            self.checklistItems.append(item)
                            self.printChecklistContents()
                    }
                }
            }//end of list
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
    
}//End of Content View

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
