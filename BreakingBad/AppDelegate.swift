//
//  AppDelegate.swift
//  BreakingBad
//
//  Created by Mostafa Nafie on 29/09/2022.
//

import UIKit
import Swinject

class AppDelegate: NSObject, UIApplicationDelegate {
    private let coordinator = Container.AppContainer.resolve(CharacterCoordinator.self)!
    lazy var rootView = CharacterCoordinatorView(coordinator: coordinator)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        coordinator.start()
        return true
    }
}
