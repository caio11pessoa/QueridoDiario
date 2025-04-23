//
//  AddPage.swift
//  QueridoDiario
//
//  Created by Lais Godinho on 10/04/25.
//

import SwiftUI
import SwiftData

struct AddPage: View {
    
    @Environment(\.modelContext) var context
    
    @StateObject private var viewModel: AddPageViewModel
    
    @Binding var isAddPagePresented: Bool
    
    init(isAddPagePresented: Binding<Bool>) {
            self._isAddPagePresented = isAddPagePresented
        self._viewModel = StateObject(wrappedValue: AddPageViewModel.shared)
        }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    isAddPagePresented.toggle()
                }, label: {
                    Text("Voltar")
                })
                Spacer()
                Text("Adicionar página")
                    .bold()
                Spacer()
                Button(action: {
                    viewModel.saveDiaryPage()
                    isAddPagePresented.toggle()
                }, label: {
                    Text("Salvar")
                })
            }
            
            HStack {
                ZStack {
                    HStack {
                        TextField("", text: $viewModel.title, prompt: Text("Título")
                            .foregroundStyle(Color.primary06))
                            .font(Font.custom("BricolageGrotesque-ExtraBold", size: 42))
                            .foregroundStyle(Color.primary06)
                        Spacer()
                    }
                    MoodPicker()
                    
                }
            }.padding(.vertical)
            
            ZStack {
                VStack {
                    TextField("", text: $viewModel.content,
                              prompt: Text("Como foi seu dia?")
                                  .foregroundStyle(Color.primary06),
                              axis: .vertical)
                        .font(Font.custom("BricolageGrotesque-Regular", size: 15))
                        .foregroundStyle(Color.primary06)
                        
                    Spacer()
                }
                ToolBar()
            }
        }
        .padding()
        .background(viewModel.color.background)
    }
}

//#Preview {
//    AddPage(isAddPagePresented: .constant(true))
//}
