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
    
    var rememberAt: DateComponents{
            switch self {
            case .empty:
                return DateComponents(hour: 0)
            case .now:
                return DateComponents(hour: 0)
            case .fiveMinutes:
                return DateComponents(minute: -5)
            case .tenMinutes:
                return DateComponents(minute: -10)
            case .fifteenMinutes:
                return DateComponents(minute: -15)
            case .thirtyMinutes:
                return DateComponents(minute: -30)
            case .oneHour:
                return DateComponents(hour: -1)
            case .twoHours:
                return DateComponents(hour: -2)
            case .oneDay:
                return DateComponents(day: -1)
            }
        }

}
