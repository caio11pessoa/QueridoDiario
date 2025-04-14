//
//  AddPage.swift
//  QueridoDiario
//
//  Created by Lais Godinho on 10/04/25.
//

import SwiftUI

struct AddPage: View {
    
    @Environment(\.modelContext) var context
    
    @State var title = ""
    
    @State var content = ""
    
    @State var mood = Mood.empty
    
    @State var color = PageColor.purple
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {}, label: {
                    Text("Voltar")
                })
                Spacer()
                Text("Adicionar página")
                    .bold()
                Spacer()
                Button(action: {
                    let repository = DiaryPageRepository(context: context)
                    
                    let _ = repository.createDiaryPage(title: title, content: content, mood: mood, color: color)
                }, label: {
                    Text("Salvar")
                })
            }
            
            HStack {
                ZStack {
                    HStack {
                        TextField("", text: $title, prompt: Text("Título")
                            .foregroundStyle(Color.primary06))
                            .font(Font.custom("BricolageGrotesque-ExtraBold", size: 42))
                            .foregroundStyle(Color.primary06)
                        Spacer()
                    }
                    MoodPicker(action: {})
                }
            }.padding(.vertical)
            
            ZStack {
                VStack {
                    TextField("", text: $content,
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
        .background(Color.primary01)
    }
}

#Preview {
    AddPage()
}
