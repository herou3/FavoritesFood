//
//  UIColor+AppColors.swift
//  Favorites Food
//
//  Created by Pavel Kurilov on 31.10.2018.
//  Copyright © 2018 Pavel Kurilov. All rights reserved.
//

import UIKit

extension UIColor {
    static func color(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    // MARK: - AppColors
    class var lightGrayishPink: UIColor {
        return color(245, 212, 221)
    }
    
    class var verySoftPink: UIColor {
        return color(237, 180, 195)
    }
    
    class var slightlyDesaturatedPink: UIColor {
        return color(214, 123, 148)
    }
    
    class var moderatePink: UIColor {
        return color(195, 63, 99)
    }
    
    class var darkModeratePink: UIColor {
        return color(152, 47, 76)
    }
    
    class var veryDarkPink: UIColor {
        return color(93, 28, 46)
    }
    
    class var mostlyBlackPink: UIColor {
        return color(33, 10, 16)
    }
}
