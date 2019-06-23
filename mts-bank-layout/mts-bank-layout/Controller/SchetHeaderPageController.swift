//
//  ViewController.swift
//  mts-bank-layout
//
//  Created by Maksim Nosov on 21/06/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

class SchetHeaderPageController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "cellId"
    let headerId = "headerId"
    
    var pageControlBottomAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .lightGray
        collectionView.isPagingEnabled = true
        
        registerCells()
    }
    
    fileprivate func registerCells() {
        collectionView.register(PageGroupCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(PageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
        return header
    }
    
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
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        cell.backgroundColor = .white
        
        return cell
    }
    
    
}

//class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//
//    lazy var collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        layout.minimumLineSpacing = 10
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.backgroundColor = .red
//        cv.dataSource = self
//        cv.delegate = self
//        cv.isPagingEnabled = true
//        return cv
//    }()
//
//    lazy var pageControl: UIPageControl = {
//        let pc = UIPageControl()
//        pc.pageIndicatorTintColor = .lightGray
//        pc.currentPageIndicatorTintColor = .white
//        pc.numberOfPages = self.topData.count + 1
//        return pc
//    }()
//
//    let topCellId = "topCellId"
//
//    override func viewDidLoad() {
//
//        super.viewDidLoad()
//
//        view.addSubview(collectionView)
////        view.addSubview(pageControl)
//
////        _ = pageControl.anchor(top: guide.topAnchor, leading: guide.leadingAnchor, bottom: guide.bottomAnchor, trailing: guide.trailingAnchor)
//
//         collectionView.anchorToTop(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
//
//        registerCells()
//    }
//
//    let topData: [TopData] = {
//        let firstPage = TopData(schet: "40702810100000000123", sum: "12 345,01 ₽", overdraft: "12 345,20 ₽ с овердрафтом", isOperation: true)
//        let secondPage = TopData(schet: "40702810100000000123", sum: "10 000,00 ₽", overdraft: "12 345,20 ₽ с овердрафтом", isOperation: false)
//
//        return [firstPage, secondPage]
//    }()
//
//
//    fileprivate func registerCells() {
//        collectionView.register(TopCell.self, forCellWithReuseIdentifier: topCellId)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return topData.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: topCellId, for: indexPath)
////            as! TopCell
////
////        let data = topData[(indexPath as NSIndexPath).item]
////        cell.data = data
//
//        return cell
//    }
////        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: topCellId, for: indexPath) as! TopCell
////
////        let data = topData[(indexPath as NSIndexPath).item]
////        cell.data = data
////
////        return cell
//
//    private func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        return CGSize(width: view.frame.width, height: view.frame.height)
//    }
//
//}
//
