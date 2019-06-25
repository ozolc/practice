//
//  VerticalStackView.swift
//  mts-bank-layout
//
//  Created by Maksim Nosov on 25/06/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

class VerticalStackView: UIStackView {
    
    init(arrangedSubviews: [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        
        arrangedSubviews.forEach({addArrangedSubview($0)})
        
        self.spacing = spacing
        self.axis = .vertical
        self.alignment = .center
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
