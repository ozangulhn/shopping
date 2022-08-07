//
//  AppDelegate.swift
//  ShoppingApp
//
//  Created by Ozan Gülhan on 7.08.2022.
//


import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    lazy var appDelegateServices: [UIApplicationDelegate] = [DependencyRegistrationService()]
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return appDelegateServices.allSatisfy { service -> Bool in
            service.application?(application, didFinishLaunchingWithOptions: launchOptions) ?? true
        }
    }
}
