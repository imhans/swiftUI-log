//
//  LandmarksApp.swift
//  Shared
//
//  Created by Hans Yim on 2021/06/01.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
