//
//  imageGeneratorAppApp.swift
//  imageGeneratorApp
//
//  Created by Illia Lotfalian on 2023-08-08.
//

import SwiftUI
import FirebaseCore


@main
struct imageGeneratorAppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
