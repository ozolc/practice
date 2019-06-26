//
//  PageHeader.swift
//  mts-bank-layout
//
//  Created by Maksim Nosov on 23/06/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

class PageHeader: UICollectionReusableView {
    
    let horizontalController = SchetHorizontalController()
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.pageIndicatorTintColor = UIColor(white: 0.75, alpha: 0.75)
        pc.currentPageIndicatorTintColor = UIColor.white
        
        return pc
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
        pageControl.numberOfPages = horizontalController.getPagesCount()
        pageControl.currentPage = horizontalController.pageNumber
        
    }
    
    func setupViews() {

        addSubview(horizontalController.view)
        horizontalController.view.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
        
        addSubview(pageControl)
        pageControl.anchor(top: horizontalController.view.bottomAnchor, leading: leadingAnchor, bottom:
            bottomAnchor, trailing: trailingAnchor)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
