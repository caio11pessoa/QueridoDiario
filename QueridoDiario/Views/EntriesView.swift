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
    @State private var selectedMode: String = "Mês"
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
            TextField("Buscar por título ou conteúdo", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            // Date Filter
            Picker("Modo de Visualização", selection: $selectedMode) {
                Text("Mês").tag("Mês")
                Text("Semana").tag("Semana")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            if selectedMode == "Mês" {
                MonthView(selectedDate: $selectedDate)
            } else {
                WeekView(selectedDate: $selectedDate)
            }

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
                    ForEach(filteredPages) { page in
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
