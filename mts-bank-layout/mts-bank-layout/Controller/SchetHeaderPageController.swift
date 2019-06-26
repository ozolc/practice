//
//  ViewController.swift
//  mts-bank-layout
//
//  Created by Maksim Nosov on 21/06/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

class SchetHeaderPageController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    var currentPage = 0
    
    fileprivate let pageButtonId = "pageButtonId"
    fileprivate let headerId = "headerId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.isPagingEnabled = true
        
        registerCells()
        
    }
    
    fileprivate func registerCells() {
        collectionView.register(PageButtonCell.self, forCellWithReuseIdentifier: pageButtonId)
        collectionView.register(PageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! PageHeader
        header.backgroundColor = UIColor.clear
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 100)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pageButtonId, for: indexPath) as! PageButtonCell
        
        return cell
    }
    
}
