//
//  TopCell.swift
//  mts-bank-layout
//
//  Created by Maksim Nosov on 21/06/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            
            guard let page = page else {
                return
            }
            
            let color = UIColor.white
            
            let attributedText = NSMutableAttributedString(string: page.schet, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium), NSAttributedString.Key.foregroundColor: color])

            attributedText.append(NSAttributedString(string: "\n\(page.sum)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 40), NSAttributedString.Key.foregroundColor: color]))
            
            attributedText.append(NSAttributedString(string: "\n\(page.overdraft)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: color]))

            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center

            let length = attributedText.string.count
            attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))

            textView.attributedText = attributedText
        }
    }
    
//    let horizontalController = SchetHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.isEditable = false
//        tv.textAlignment = .center
        tv.textContainerInset = UIEdgeInsets(top: 50, left: 5, bottom: 5, right: 5)
        tv.backgroundColor = .red
        return tv
    }()
    
    func setupViews() {

        addSubview(textView)
        textView.fillSuperview(padding: .init(top: 8, left: 0, bottom: 8, right: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
