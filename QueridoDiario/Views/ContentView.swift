//
//  ContentView.swift
//  QueridoDiario
//
//  Created by Caio de Almeida Pessoa on 07/01/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab = 0

    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                Group {
                    switch selectedTab {
                    case 0: HomeView()
                    case 1: EntriesView()
                    case 2: SettingsView()
                    default: HomeView()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                RoundedTabBar(selectedTab: $selectedTab)
            }
            .background(Color(.primary01))
            .ignoresSafeArea(.all, edges: .bottom)
            .onAppear {
                DeviceDimensions.shared.setDimension(geometry: geometry)
            }
        }
    }
}

#Preview {
    ContentView()
}

