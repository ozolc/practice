//
//  SchetPageController.swift
//  mts-bank-layout
//
//  Created by Maksim Nosov on 25/06/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

//protocol SchetPageDelegate: class {
//    func updateCurrentPage(with number: Int)
//}

import UIKit

class SchetPageController: BaseListController, UICollectionViewDelegateFlowLayout, SchetHorizontalDelegate {
    
    var currentPage = 0
    
    let headerId = "headerId"
    fileprivate let pageButtonId = "pageButtonId"
    
    weak var delegate: SchetHorizontalDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
        
        addBackgroundGradient()
        
    }
    
    func updateCurrentPage(with number: Int) {
        self.currentPage = number
        print("currentPage = ", number)
        
        
        reloadLocal()
        
//        self.collectionView.collectionViewLayout.invalidateLayout()
//        self.collectionView.reloadData()
    }
    
    func reloadLocal() {
        DispatchQueue.main.async {
        self.collectionView.reloadData()
        self.collectionView.collectionViewLayout.invalidateLayout()
        print("local reload")
        }
    }
    
    fileprivate func registerCells() {
        collectionView.register(PageButtonCell.self, forCellWithReuseIdentifier: pageButtonId)
        collectionView.register(PageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    private func addBackgroundGradient() {
        let collectionViewBackgroundView = UIView()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame.size = view.frame.size
        
        let colorTop =  UIColor(red: 188.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 204.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.colors = [colorTop, colorBottom]
        collectionView.backgroundView = collectionViewBackgroundView
        collectionView.backgroundView?.layer.addSublayer(gradientLayer)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! PageHeader
        
        print("header refreshed")
        header.backgroundColor = UIColor.clear
        header.pageControl.currentPage = currentPage
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 100)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pageButtonId, for: indexPath) as! PageButtonCell
        cell.backgroundColor = UIColor.clear
        
        print("reload PageButtonCell")
        return cell
    }
    
//    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        UIView.animate(withDuration: 1, animations: {
//            var newFrame = cell.frame
//            cell.frame = CGRect(x: newFrame.origin.x, y: newFrame.origin.y + 100, width: newFrame.width, height: newFrame.height)
//        })
//    }
    
}

