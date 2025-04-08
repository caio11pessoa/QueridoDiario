//
//  ContentView.swift
//  QueridoDiario
//
//  Created by Caio de Almeida Pessoa on 07/01/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    

    @ObservedObject private var screen = DeviceDimensions.shared
    
    var body: some View {
        GeometryReader { geometry in
            TabView {
                EntriesView()
                    .tabItem {
                        Image("Icon=Home, State=Default, Bg Fill=False")
                            .renderingMode(.template)
                        Text("Início")
                    }
                    .tag(0)
                
                NewEntryView()
                    .tabItem {
                        Image("Icon=Diario, State=Default, Bg Fill=False")
                            .renderingMode(.template)
                        Text("Diário")
                    }
                    .tag(1)
                
                SettingsView()
                    .tabItem {
                        Image("Icon=Config, State=Default, Bg Fill=False")
                            .renderingMode(.template)
                        Text("Ajustes")
                    }
                    .tag(2)
            }
        }
    }
}

#Preview {
    ContentView()
}
