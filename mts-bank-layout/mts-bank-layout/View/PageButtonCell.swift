//
//  PageButtonCell.swift
//  mts-bank-layout
//
//  Created by Maksim Nosov on 23/06/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

class PageButtonCell: UICollectionViewCell {
    
    lazy var buttonArray = [
        UIButton(type: .system),
        UIButton(type: .system),
        UIButton(type: .system)
    ]
    
    lazy var labelArray = [
        UILabel(text: "Выписка", font: .systemFont(ofSize: 16)),
        UILabel(text: "Реквизиты", font: .systemFont(ofSize: 16)),
        UILabel(text: "Прочее", font: .systemFont(ofSize: 16)),
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    func setupViews() {
        backgroundColor = .red
        
        for (index, button) in buttonArray.enumerated() {
//        buttonArray.forEach { button in
            button.backgroundColor = UIColor(white: 0.95, alpha: 1)
            button.constrainWidth(constant: 80)
            button.constrainHeight(constant: 80)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            let image = UIImage(named: "button\(index)")
            button.tintColor = .white
            button.setImage(image?.withRenderingMode(.alwaysTemplate), for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
            button.layer.cornerRadius = 80 / 2
            button.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
            button.backgroundColor = UIColor(white: 1.0, alpha: 0.35)
        }
        
        labelArray.forEach { (label) in
            label.textColor = UIColor.white
        }
        
        let stackView = UIStackView()
        
        for i in 0...2 {
            stackView.addArrangedSubview(VerticalStackView(arrangedSubviews: [buttonArray[i], labelArray[i]], spacing: 4))
        }
        
        stackView.spacing = 16
        stackView.distribution = .equalCentering
        
        stackView.alignment = .center
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 0, left: 24, bottom: 0, right: 24))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
