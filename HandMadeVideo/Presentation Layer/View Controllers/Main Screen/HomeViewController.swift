//
//  HomeViewController.swift
//  HandMadeVideo
//
//  Created by Serg Melnik on 12/7/15.
//  Copyright © 2015 Serg Melnik. All rights reserved.
//

import UIKit
import Foundation

class HomeViewController: UIViewController {
   
    @IBOutlet weak var collectionView: UICollectionView!
    
    var addContentViewController : AddContentViewController?
    
    override func viewDidLoad() {
        setupCollectionView()
        setupAddContentButton()
    }
    
    
    // MARK: - Privates -
    
    func setupCollectionView() {
        collectionView?.registerNib(HomeCell.nib(), forCellWithReuseIdentifier: HomeCell.cellIdentifier)
    }
    
    func setupAddContentButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: NSLocalizedString("Add", comment: "Add"),
            style: .Plain,
            target: self,
            action: Selector("showAddContentScreen"))
    }
    
    func showAddContentScreen() {
        let addContentViewController = AddContentViewController()
        navigationController?.pushViewController(addContentViewController, animated: true)
    }

    
    //MARK: - Delegates -
    //MARK: UICollectionViewDelegate
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(HomeCell.cellIdentifier, forIndexPath: indexPath) as! HomeCell
       
        return cell
    }
}
