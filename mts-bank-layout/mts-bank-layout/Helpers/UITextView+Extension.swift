//
//  UITextView+Extension.swift
//  mts-bank-layout
//
//  Created by Maksim Nosov on 23/06/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

extension UITextView {
    
    func centerText() {
        self.textAlignment = .center
        let fittingSize = CGSize(width: bounds.width, height: CGFloat.greatestFiniteMagnitude)
        let size = sizeThatFits(fittingSize)
        let topOffset = (bounds.size.height - size.height * zoomScale) / 2
        let positiveTopOffset = max(1, topOffset)
        contentOffset.y = -positiveTopOffset
    }
    
}
