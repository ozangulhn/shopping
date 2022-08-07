//
//  ShoppingApp.swift
//  ShoppingApp
//
//  Created by Ozan Gülhan on 4.08.2022.
//

import SwiftUI

@main
struct ShoppingApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ProductSearchView()
                .preferredColorScheme(.light)
        }
    }
}
