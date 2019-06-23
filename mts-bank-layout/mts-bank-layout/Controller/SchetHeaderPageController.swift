//
//  ViewController.swift
//  mts-bank-layout
//
//  Created by Maksim Nosov on 21/06/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

protocol SchetHeaderPageDelegate: class {
    func updateCurrentPage(with pageNumber: Int)
}

class SchetHeaderPageController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    var currentPage = 0
    
    fileprivate let pageCellId = "pageCellId"
    fileprivate let pageButtonId = "pageButtonId"
    fileprivate let headerId = "headerId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .lightGray
        collectionView.isPagingEnabled = true
        
        registerCells()
    }
    
    fileprivate func registerCells() {
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: pageCellId)
        collectionView.register(PageButtonCell.self, forCellWithReuseIdentifier: pageButtonId)
        collectionView.register(PageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: pageButtonId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! PageHeader
        
        header.pageControl.currentPage = indexPath.item
        
        return header
    }
    
    //    func updateCurrentPage(with pageNumber: Int) {
    //        self.currentPage = pageNumber
    //    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 150)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            switch indexPath.item {
            case 0:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pageCellId, for: indexPath) as! PageCell
                return cell
            case 1:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pageButtonId, for: indexPath) as! PageButtonCell
                return cell
            default:
                return UICollectionViewCell()
            }
            
            //        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        }
        return UICollectionViewCell()
    }
    
}
