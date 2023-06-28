//
//  Task.swift
//  LoveMyCapibara
//
//  Created by Maurício de Moura on 27/06/23.
//

import Foundation

struct TaskModel {
    var pet: PetModel = PetModel()
    var title: String = ""
    var description: String = ""
    var isFinished: Bool = false
    var date: Date = Date.now
}
