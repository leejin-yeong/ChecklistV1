//
//  Checklistitem.swift
//  ChecklistV1
//
//  Created by Release on 2020/06/03.
//  Copyright © 2020 Jinyoung Lee. All rights reserved.
//

import Foundation

struct ChecklistItem: Identifiable{
    let id = UUID() //give unique id
    var name: String
    var isChecked: Bool = false
}
