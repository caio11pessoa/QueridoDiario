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
        VStack {
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
                Button(action: {
                    viewModel.saveDiaryPage()
                    isViewPagePresented.toggle()
                }, label: {
                    Text("Salvar")
                })
            }
            
            HStack {
                ZStack {
                    HStack {
                        Text(viewModel.title)
                            .font(Font.custom("BricolageGrotesque-ExtraBold", size: 42))
                            .foregroundStyle(Color.primary06)
                        Spacer()
                    }
                    MoodPicker()
                    
                }
            }.padding(.vertical)
            
            ZStack {
                VStack {
                    Text(viewModel.content)
                        .font(Font.custom("BricolageGrotesque-Regular", size: 15))
                        .foregroundStyle(Color.primary06)
                        
                    Spacer()
                }
            }
        }
        .padding()
        .background(viewModel.color.background)
    }
}
