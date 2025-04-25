//
//  ViewPage.swift
//  QueridoDiario
//
//  Created by Lais Godinho on 23/04/25.
//

import SwiftUI

struct ViewPage: View {
    @Environment(\.modelContext) var context
    
    @StateObject private var viewModel: PageViewModel
    
    @Binding var isViewPagePresented: Bool
    
    init(isViewPagePresented: Binding<Bool>) {
            self._isViewPagePresented = isViewPagePresented
        self._viewModel = StateObject(wrappedValue: PageViewModel.shared)
        }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                    isViewPagePresented.toggle()
                }, label: {
                    Text("Voltar")
                })
                Spacer()
                Text("Adicionar página")
                    .bold()
                Spacer()
                Image(systemName: "ellipsis")
                    .contextMenu {
                        Button {
                            // Add this item to a list of favorites.
                        } label: {
                            Label("Editar", systemImage: "square.and.pencil")
                        }
                        Button {
                            if let id = viewModel.id {
                                viewModel.deleteDiaryPage(by: id)
                                isViewPagePresented = false
                            }
                            
                        } label: {
                            Label("Excluir", systemImage: "trash")
                        }
                    }
            }
            
            HStack {
                ZStack {
                    HStack {
                        Text(viewModel.title)
                            .font(Font.custom("BricolageGrotesque-ExtraBold", size: 42))
                            .foregroundStyle(Color.primary06)
                        Spacer()
                        viewModel.mood.emote
                            .resizable()
                            .frame(width: 59.44, height: 59.44)
                    }
                    
                }
            }.padding(.vertical)
            
//            ZStack {
                VStack(alignment: .leading) {
                    Text(viewModel.content)
                        .font(Font.custom("BricolageGrotesque-Regular", size: 15))
                        .foregroundStyle(Color.primary06)
                        
                    Spacer()
                }
//            }
        }
        .padding()
        .background(viewModel.color.background)
    }
}
