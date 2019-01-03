//
//  UINavigationController.swift
//  Favorites Food
//
//  Created by Pavel Kurilov on 20.11.2018.
//  Copyright © 2018 Pavel Kurilov. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    func configureNavigationBar(navigationController: UINavigationController) {
        let textAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black]
        navigationController.navigationBar.barTintColor = .moderatePink
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.tintColor = .black
        navigationController.navigationBar.titleTextAttributes = textAttributes
    }
}
