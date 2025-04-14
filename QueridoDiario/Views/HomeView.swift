//
//  HomeView.swift
//  QueridoDiario
//
//  Created by Lais Godinho on 08/04/25.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var isAddPagePresented: Bool
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                DashedCard {
                    VStack {
                        Text("Esceva seu registro de hoje")
                        CustomButton(
                            action: {
                                isAddPagePresented.toggle()
                            },
                            buttonColor: .purple,
                            buttonStyle: ButtonType.plusIcon("Adicionar Página", .purple)
                        )
                    }.padding(.vertical)
                }
                Text("Recentes")
                    .font(Font.custom("BricolageGrotesque-ExtraBold", size: 24))
                    .foregroundStyle(Color.primary06)
                ScrollView {
                    Card(entry: DiaryPage(title: "Sonho", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", mood: Mood.maligno, color: PageColor.pink), formatedDate: DateFormatterHelper.shared.format(date: Date()))
                }
            }
            .background(Color.primary01)
            .padding()
        }
    }
}

#Preview {
    HomeView(isAddPagePresented: .constant(false))
}
