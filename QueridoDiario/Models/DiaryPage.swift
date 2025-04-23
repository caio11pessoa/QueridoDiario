//
//  DiaryPage.swift
//  QueridoDiario
//
//  Created by Lais Godinho on 07/04/25.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class DiaryPage {
    var id = UUID()
    var title: String
    var content: String
    var mood: Mood
    var color: PageColor
    var createdAt: Date
    
    init(title: String, content: String, mood: Mood, color: PageColor) {
        self.title = title
        self.content = content
        self.mood = mood
        self.color = color
        self.createdAt = Date()
    }
}

enum PageColor: Codable, CaseIterable {
    case blue
    case pink
    case purple
    case green
    case white
    
    var standard: Color {
        switch self {
        case .blue:
            return Color("tertiary_02")
        case .pink:
            return Color("secondary_02")
        case .purple:
            return Color("primary_02")
        case .green:
            return Color("quaternary_02")
        case .white:
            return Color("neutrals_01")
        }
    }
    
    var selected: Color {
        switch self {
        case .blue:
            return Color("tertiary_03")
        case .pink:
            return Color("secondary_04")
        case .purple:
            return Color("primary_03")
        case .green:
            return Color("quaternary_03")
        case .white:
            return Color("neutrals_01")
        }
    }
    
    var background: Color {
        switch self {
        case .blue:
            return Color("tertiary_01")
        case .pink:
            return Color("secondary_01")
        case .purple:
            return Color("primary_01")
        case .green:
            return Color("quaternary_01")
        case .white:
            return Color("neutrals_01")
        }
    }
    
}

enum Mood: Codable, CaseIterable {
    
    case intrigado
    case feliz
    case uau
    
    case animado
    case reclamao
    case distraido
    
    case lesado
    case surpresa
    case enojado
    
    case assustado
    case maligno
    case falante
    
    case tristonho
    case maravilhado
    case rapaaaaz
    
    case empty
    
    var emote: Image {
        switch self {
        case .animado:
            return Image(.animado)
        case .assustado:
            return Image(.assustado)
        case .distraido:
            return Image(.distraido)
        case .empty:
            return Image(.empty)
        case .enojado:
            return Image(.enojado)
        case .falante:
            return Image(.falante)
        case .feliz:
            return Image(.feliz)
        case .intrigado:
            return Image(.intrigado)
        case .lesado:
            return Image(.lesado)
        case .maligno:
            return Image(.maligno)
        case .maravilhado:
            return Image(.maravilhado)
        case .rapaaaaz:
            return Image(.rapaaaaz)
        case .reclamao:
            return Image(.reclamao)
        case .surpresa:
            return Image(.surpresa)
        case .tristonho:
            return Image(.tristonho)
        case .uau:
            return Image(.uau)
        }
    }
}
