//
//  EntriesView.swift
//  QueridoDiario
//
//  Created by Lais Godinho on 08/04/25.
//

import SwiftData
import SwiftUI

struct EntriesView: View {
    @State private var searchText: String = ""
    @State private var selectedDate: Date = Date()
    @Binding var isAddPagePresented: Bool
    @Binding var isViewPagePresented: Bool
    @StateObject var viewModel = PageViewModel.shared
    @Query var pages: [DiaryPage]

    var filteredPages: [DiaryPage] {
        pages.filter { page in
            (searchText.isEmpty || page.title.contains(searchText) || page.content.contains(searchText)) &&
            Calendar.current.isDate(page.createdAt, inSameDayAs: selectedDate)
        }
    }

    var body: some View {
        VStack {
            // Text Filter
            TextField("Pesquise os diários salvos", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            CalendarFilter(selectedDate: $selectedDate)

            // DiaryPages List
            if filteredPages.isEmpty {
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
            } else {
                Text("Recentes")
                    .font(Font.custom("BricolageGrotesque-ExtraBold", size: 24))
                    .foregroundStyle(Color.primary06)
                ScrollView {
                    ForEach(pages) { page in
                        Card(entry: page, formatedDate: DateFormatterHelper.shared.format(date: page.createdAt))
                            .onTapGesture {
                                viewModel.setValues(page: page)
                                isViewPagePresented.toggle()
                            }
                    }
                }
            }
            Spacer()
        }
        .padding()
    }
}
