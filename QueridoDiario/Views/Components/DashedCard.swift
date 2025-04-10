//
//  TesteQuadro.swift
//  QueridoDiario
//
//  Created by Caio de Almeida Pessoa on 10/04/25.
//

import SwiftUI

struct DashedCard<Content: View>: View {
    var content: Content
    var innerPadding: CGFloat
    
    init(innerPadding: CGFloat = 16, @ViewBuilder content: @escaping () -> Content) {
        self.content = content()
        self.innerPadding = innerPadding
    }
    
    var body: some View {
        content
            .padding(innerPadding)
            .background {
                RoundedRectangle(cornerRadius: 24)
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [12]))
                    .foregroundStyle(.primary02)
            }
    }
}

#Preview {
    DashedCard(innerPadding: 40){
        VStack{
            Text("Teste")
                .font(.title)
            Text("Teste")
        }
    }
    .padding()
}
