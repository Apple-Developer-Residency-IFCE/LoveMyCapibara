//
//  Frequency.swift
//  LoveMyCapibara
//
//  Created by Ravi on 28/06/23.
//

import Foundation

enum FrequencyModel: String, CaseIterable {
    case daily = "Todo dia"
    case weekly = "Toda semana"
    case twoWeeks = "A cada 2 semanas"
    case monthly = "Todo mês"
    case annually = "Todo ano"
    case never = "Nunca"
    
    var frequencyBla: Set<Calendar.Component> {
            switch self {
            case .daily:
                return [.day, .hour, .minute]
            case .weekly:
                return [.weekday, .hour, .minute]
            case .monthly:
                return [.month, .day, .hour , .minute]
            case .annually:
                return [.year, .month, .day, .hour, .minute]
            default:
                return []
            }
        }
}
