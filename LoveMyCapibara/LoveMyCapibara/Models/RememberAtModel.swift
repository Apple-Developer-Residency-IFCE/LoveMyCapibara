//
//  RememberMe.swift
//  LoveMyCapibara
//
//  Created by Ravi on 28/06/23.
//

import Foundation

enum RememberAtModel: String, CaseIterable {
    case empty = "Nenhum"
    case now = "Na hora da tarefa"
    case fiveMinutes = "5 minutos antes"
    case tenMinutes = "10 minutos antes"
    case fifteenMinutes = "15 minutos antes"
    case thirtyMinutes = "30 minutos antes"
    case oneHour = "1 hora antes"
    case twoHours = "2 horas antes"
    case oneDay = "1 dia antes"
}
