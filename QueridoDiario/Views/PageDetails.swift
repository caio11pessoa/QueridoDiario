//
//  ViewPage.swift
//  QueridoDiario
//
//  Created by Lais Godinho on 23/04/25.
//

import SwiftUI

struct PageDetails: View {
    @Environment(\.modelContext) var context
    
    @StateObject private var viewModel: PageViewModel
    
    @Binding var isViewPagePresented: Bool
    
    @State var isEditModeOn = false
    
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
                if isEditModeOn {
                    Button(action: {
                        isEditModeOn.toggle()
                        viewModel.editDiaryPage()
                    }, label: {
                        Text("Salvar")
                    })
                } else {
                    Image(systemName: "ellipsis")
                        .contextMenu {
                            Button {
                                isEditModeOn.toggle()
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
            }
            
            HStack {
                ZStack {
                    
                    if isEditModeOn {
                        HStack {
                            TextField("", text: $viewModel.title, prompt: Text(viewModel.title)
                                .foregroundStyle(Color.primary06))
                                .font(Font.custom("BricolageGrotesque-ExtraBold", size: 42))
                                .foregroundStyle(Color.primary06)
                            Spacer()
                        }
                        MoodPicker()
                    } else {
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
                    
                    
                    
                    
                }
            }.padding(.vertical)
            
//            ZStack {
            if isEditModeOn {
                ZStack {
                    VStack {
                        TextField("", text: $viewModel.content,
                                  prompt: Text(viewModel.content)
                                      .foregroundStyle(Color.primary06),
                                  axis: .vertical)
                            .font(Font.custom("BricolageGrotesque-Regular", size: 15))
                            .foregroundStyle(Color.primary06)
                            
                        Spacer()
                    }
                    ToolBar()
                }
            } else {
                VStack(alignment: .leading) {
                    Text(viewModel.content)
                        .font(Font.custom("BricolageGrotesque-Regular", size: 15))
                        .foregroundStyle(Color.primary06)
                        
                    Spacer()
                }
            }
//            }
        }
        .padding()
        .background(viewModel.color.background)
    }
}
