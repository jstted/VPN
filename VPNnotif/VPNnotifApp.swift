//
//  VPNnotifApp.swift
//  VPNnotif
//
//  Created by Mikhail Tedeev on 08.06.2024.
//

import SwiftUI

@main
struct VPNnotifApp: App {
    @AppStorage("isActive") private var isActive = false
    
    var body: some Scene {
        MenuBarExtra {
            ContentView()
        } label: {
            AppLabel(isConnected: $isActive)
                .onAppear {
                    VPNChecker.startLoop()
                    NSApplication.shared.setActivationPolicy(.accessory)
                }
        }
    }
}
