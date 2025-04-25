//
//  ContentView.swift
//  QueridoDiario
//
//  Created by Caio de Almeida Pessoa on 07/01/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab = 0

    @State var isAddPagePresented: Bool = false
    
    @State var isViewPagePresented: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack(alignment: .bottom) {
                    Group {
                        switch selectedTab {
                        case 0: HomeView(isAddPagePresented: $isAddPagePresented, isViewPagePresented: $isViewPagePresented)
                        case 1: EntriesView()
                        case 2: SettingsView()
                        default: HomeView(isAddPagePresented: $isAddPagePresented, isViewPagePresented: $isViewPagePresented)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.bottom, 90)
                    
                    RoundedTabBar(selectedTab: $selectedTab)
                }
                .ignoresSafeArea(.all, edges: .bottom)
                .onAppear {
                    DeviceDimensions.shared.setDimension(geometry: geometry)
                }
            }
            .background(Color(.primary01))
            .fullScreenCover(isPresented: $isAddPagePresented) {
                AddPage(isAddPagePresented: $isAddPagePresented)
            }
            .fullScreenCover(isPresented: $isViewPagePresented) {
                ViewPage(isViewPagePresented: $isViewPagePresented)
            }
        }
    }
}

#Preview {
    ContentView()
}

