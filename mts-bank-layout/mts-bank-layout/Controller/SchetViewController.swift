//
//  ViewController.swift
//  mts-bank-layout
//
//  Created by Maksim Nosov on 21/06/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

class SchetViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "cellId"
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.pageIndicatorTintColor = .lightGray
        pc.currentPageIndicatorTintColor = UIColor(red: 247/255, green: 154/255, blue: 27/255, alpha: 1)
        pc.numberOfPages = self.pages.count + 1
        return pc
    }()
    
    var pageControlBottomAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        view.addSubview(pageControl)
        
        pageControlBottomAnchor = pageControl.anchor(nil, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 40)[1]
//
        registerCells()
    }
    
    let pages: [Page] = {
        let firstPage = Page(schet: "Счет 40702810100000000123", sum: "12 345,01 ₽", overdraft: "12 345,20 ₽ с овердрафтом", isOperation: true)
        let secondPage = Page(schet: "Счет 40702810100000000123", sum: "10 000,00 ₽", overdraft: "12 345,20 ₽ с овердрафтом", isOperation: false)
        
        return [firstPage, secondPage]
    }()
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 250)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        
        let page = pages[(indexPath as NSIndexPath).item]
        cell.page = page
        
        return cell
    }
    
    fileprivate func registerCells() {
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
