//
//  HomeView.swift
//  QueridoDiario
//
//  Created by Lais Godinho on 08/04/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
//    @Environment(\.modelContext) var context
    
    @Binding var isAddPagePresented: Bool
    
    @Binding var isViewPagePresented: Bool
    
    @StateObject var viewModel = PageViewModel.shared
    
    @Query var pages: [DiaryPage]
    
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
                    ForEach(pages) {page in
                        Card(entry: page, formatedDate: DateFormatterHelper.shared.format(date: page.createdAt))
                            .onTapGesture {
                                viewModel.setValues(page: page)
                                isViewPagePresented.toggle()
                            }
                    }
                    
                }
            }
            .padding()
            .background(Color.primary01)
        }
    }
}

