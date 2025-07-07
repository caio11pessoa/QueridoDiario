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
    
    @State private var randomImage: String = Bool.random() ? "Verdin" : "Rosinha"
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Image(randomImage)
                        .resizable()
                        .frame(width: 65.75, height: 42)
                    Spacer()
                }
                .padding()
                ZStack(alignment: .bottom) {
                    Group {
                        switch selectedTab {
                        case 0: HomeView(isAddPagePresented: $isAddPagePresented, isViewPagePresented: $isViewPagePresented)
                        case 1: EntriesView(isAddPagePresented: $isAddPagePresented, isViewPagePresented: $isViewPagePresented)
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
                PageDetails(isViewPagePresented: $isViewPagePresented)
            }
        }
    }
}

#Preview {
    ContentView()
}

