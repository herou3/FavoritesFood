//
//  AppDelegate.swift
//  Favorites Food
//
//  Created by Pavel Kurilov on 30.10.2018.
//  Copyright © 2018 Pavel Kurilov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: CompanyListCoordinator?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = UINavigationController(nibName: nil, bundle: nil)
        guard let navigationController = window?.rootViewController as? UINavigationController else { return true }
        coordinator = CompanyListCoordinator(navigationController: navigationController)
        coordinator?.start()
        
        return true
    }
}
