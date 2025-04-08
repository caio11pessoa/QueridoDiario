//
//  Card.swift
//  QueridoDiario
//
//  Created by Lais Godinho on 08/04/25.
//

import SwiftUI

struct Card: View {
    
    let entry: DiaryPage
    
    let formatedDate: (day: String, time: String, period: String)
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(formatedDate.day)
                        .font(Font.custom("BricolageGrotesque-Regular", size: 11))
                    HStack {
                        Text(formatedDate.time)
                            .font(Font.custom("BricolageGrotesque-ExtraBold", size: 32))
                        Text(formatedDate.period)
                            .font(Font.custom("BricolageGrotesque-Regular", size: 13.41))
                    }
                }
                Spacer()
                entry.mood.emote
                    .resizable()
                    .frame(width: 58, height: 58)
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Text(entry.title)
                        .font(Font.custom("BricolageGrotesque-SemiBold", size: 22.88))
                    Spacer()
                }
                Text(entry.content)
                    .font(Font.custom("BricolageGrotesque-Regular", size: 13))
                    .lineLimit(2)
            }
        }
        .foregroundStyle(Color("primary_06"))
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(Color("primary_03")), lineWidth: entry.color == PageColor.white ? 2 : 0)
                .background(entry.color.standard)
                .cornerRadius(20)
        )
        
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    Card(entry: DiaryPage(title: "Sonho", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", mood: Mood.maligno, color: PageColor.pink, createdAt: Date()), formatedDate: DateFormatterHelper.shared.format(date: Date()))
}
