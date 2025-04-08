//
//  ToolBar.swift
//  QueridoDiario
//
//  Created by Lais Godinho on 08/04/25.
//

import SwiftUI

struct ToolBar: View {
    
    @ObservedObject var screen = DeviceDimensions.shared
    
    var body: some View {
        HStack {
            Spacer()
            Text("hello \(screen.width)x\(screen.height)")
                
            Spacer()
        }
        .background(Color("primary_03"))
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ToolBar()
}
