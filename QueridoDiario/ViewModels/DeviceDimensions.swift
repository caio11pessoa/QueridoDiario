//
//  DeviceDimensions.swift
//  QueridoDiario
//
//  Created by Lais Godinho on 08/04/25.
//

import SwiftUI

class DeviceDimensions: ObservableObject {
    
    static let shared = DeviceDimensions()
    
    @Published var width: CGFloat = 0
    @Published var height: CGFloat = 0
    
    private init() {}
    
    func setDimension(geometry: GeometryProxy) {
        width = geometry.size.width
        height = geometry.size.height
    }
}
