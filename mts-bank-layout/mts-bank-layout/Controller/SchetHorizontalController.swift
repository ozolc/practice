//
//  SchetHorizontalController.swift
//  mts-bank-layout
//
//  Created by Maksim Nosov on 23/06/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

//protocol SchetHorizontalDelegate: class {
//    func updateCurrentPage(with number: Int)
//}

import UIKit

class SchetHorizontalController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "cellId"

    var pageNumber = 0
    
    // MARK:- Delegate
    weak var delegate: SchetPageDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .clear
    
        registerCells()
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
        self.collectionView.delegate = self
        
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    fileprivate func registerCells() {
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func getPagesCount() -> Int{
        return pages.count
    }
    
    let pages: [Page] = {
        let firstPage = Page(schet: "Счет 40702810100000000123", sum: "12 345,01 ₽", overdraft: "12 345,20 ₽ с овердрафтом", isOperation: true)
        let secondPage = Page(schet: "Счет 40702810100000000123", sum: "10 000,00 ₽", overdraft: "12 345,20 ₽ с овердрафтом", isOperation: false)
        
        return [firstPage, secondPage]
    }()
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        let page = pages[(indexPath as NSIndexPath).item]
        cell.backgroundColor = UIColor.clear
        cell.page = page
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 16, height: view.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 8, bottom: -16, right: 8)
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        self.pageNumber = Int(ceil(targetContentOffset.pointee.x / view.frame.width))
        
        delegate?.updateCurrentPage(with: pageNumber)
        
        print("pressed")
    }
    
//    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
//
//        collectionView.collectionViewLayout.invalidateLayout()
//        print("will transition")
//        DispatchQueue.main.async {
////            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
//            self.collectionView.reloadData()
//        }
//
//    }
}
