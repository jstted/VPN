//
//  ContentView.swift
//  VPNnotif
//
//  Created by Mikhail Tedeev on 08.06.2024.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isActive") private var isConnected = false
    @State var shortcuts = [ShortcutInfo]()
    @State var selection = ""
    
    var body: some View {
        VStack {
            Text(isConnected ? Constants.Status.connected : Constants.Status.notConnected)
        }
        .padding()
        
        Button(
            action: {
                let process = Process()
                process.executableURL = URL(filePath: "/usr/bin/shortcuts")
                process.arguments = ["run", "switch VPN"]
                try? process.run()
                isConnected = VPNChecker.isVpnActive()
            },
            label: {
                Text(isConnected ? Constants.ConnectButton.disconnect : Constants.ConnectButton.connect)
            }
        )
        
        Button(
            action: {
                NSApplication.shared.terminate(nil)
            },
            label: {
                Text("Quit")
            }
        )
    }
}

#Preview {
    ContentView()
}
