//
//  CardForIndexOnboarding.swift
//  LoveMyCapibara
//
//  Created by Ravi on 17/07/23.
//

import SwiftUI

enum CardForIndexOnboarding: CaseIterable, Hashable {
    case one
    case two
    case three
    
    var title: String {
        switch self {
        case .one:
            return "Cadastrar seu pet"
        case .two:
            return "Lembrar de vacinas"
        case .three:
            return "Organizar rotinas"
        }
    }
    
    var subTitle: String {
        switch self {
        case .one:
            return "Tenha as informações do seu pet e todo\nhistórico para consultas futuras."
        case .two:
            return "Agende consultas, vacinas e medicamentos\npara nunca mais esquecer."
        case .three:
            return "Organize as rotinas dos seus pets. Crie tarefas\ne as visualize em um calendário."
        }
    }
    
    var image: Image {
        switch self {
        case .one:
            return Image("imgOnboarding1")
        case .two:
            return Image("imgOnboarding2")
        case .three:
            return Image("imgOnboarding3")
        }
    }
}
