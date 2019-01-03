//
//  UITextView+CenterVertically.swift
//  Favorites Food
//
//  Created by Pavel Kurilov on 16.12.2018.
//  Copyright © 2018 Pavel Kurilov. All rights reserved.
//

import UIKit

extension UITextView {
    
    func centerVertically() {
        let fittingSize = CGSize(width: bounds.width, height: CGFloat.greatestFiniteMagnitude)
        let size = sizeThatFits(fittingSize)
        let topOffset = (bounds.size.height - size.height * zoomScale) / 2
        let positiveTopOffset = max(1, topOffset)
        contentOffset.y = -positiveTopOffset
    }
    
}
