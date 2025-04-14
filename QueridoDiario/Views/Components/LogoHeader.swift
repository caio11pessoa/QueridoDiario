//
//  LogoHeader.swift
//  QueridoDiario
//
//  Created by Lais Godinho on 14/04/25.
//

import SwiftUI

struct LogoHeader: View {
    var body: some View {
        HStack {
            Image("Verdin")
                .resizable()
                .frame(width: 87.32, height: 55.71)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    LogoHeader()
}
