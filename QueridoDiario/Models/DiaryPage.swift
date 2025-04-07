//
//  DiaryPage.swift
//  QueridoDiario
//
//  Created by Lais Godinho on 07/04/25.
//

import Foundation
import SwiftUI

struct DiaryPage {
    var title: String
    var content: String
    var mood: Mood
    var color: PageColor
    var createdAt: Date
}

enum PageColor: Codable {
    case blue
    case pink
    case purple
    case green
    case white
    
    var color: Color {
        switch self {
        case .blue:
            return Color("tertiary_02")
        case .pink:
            return Color("secondary_04")
        case .purple:
            return Color("primary_03")
        case .green:
            return Color("quaternary_03")
        case .white:
            return Color("neutrals_02")
        }
    }
}

enum Mood: Codable {
    case animado
    case assustado
    case distraido
    case empty
    case enojado
    case falante
    case feliz
    case intrigado
    case lesado
    case maligno
    case maravilhado
    case rapaaaaz
    case reclamao
    case surpresa
    case tristonho
    case uau
    
    var emote: Image {
        switch self {
        case .animado:
            return Image("animado")
        case .assustado:
            return Image("assustado")
        case .distraido:
            return Image("distraido")
        case .empty:
            return Image("empty")
        case .enojado:
            return Image("enojado")
        case .falante:
            return Image("falante")
        case .feliz:
            return Image("feliz")
        case .intrigado:
            return Image("intrigado")
        case .lesado:
            return Image("lesado")
        case .maligno:
            return Image("maligno")
        case .maravilhado:
            return Image("maravilhado")
        case .rapaaaaz:
            return Image("rapaaaaz")
        case .reclamao:
            return Image("reclamao")
        case .surpresa:
            return Image("surpresa")
        case .tristonho:
            return Image("tristonho")
        case .uau:
            return Image("uau")
        }
    }
}
