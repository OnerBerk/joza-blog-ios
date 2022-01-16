//
//  ClientMobileApp.swift
//  ClientMobile
//
//  Created by onAir on 15/01/2022.
//

import SwiftUI

@main
struct ClientMobileApp: App {
    var network=Network()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(network)
        }
    }
}
