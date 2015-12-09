//
//  HomeViewController.swift
//  HandMadeVideo
//
//  Created by Serg Melnik on 12/7/15.
//  Copyright © 2015 Serg Melnik. All rights reserved.
//

import UIKit
import Foundation

class HomeViewController: UIViewController, AddContentViewControllerDelegate {
    /* Outlet for collection view. */
    @IBOutlet weak var collectionView: UICollectionView!
    
    /* Property of array for contents items. */
    var contentArray: [Content] = []
    
    override func viewDidLoad() {
        setupCollectionView()
        setupAddContentButton()
    }

    
    // MARK: - Interface -

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
        let viewController = AddContentViewController()
        viewController.delegate = self
        let nc = UINavigationController(rootViewController: viewController)
        presentViewController(nc, animated: true, completion: nil)
    }

    
    //MARK: - Delegates -
    //MARK: UICollectionViewDelegate
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contentArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let content: Content = contentArray[indexPath.row]
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(HomeCell.cellIdentifier, forIndexPath: indexPath) as! HomeCell
        cell.titleLabel.text = content.title
       
        return cell
    }
    
    
    //MARK: AddContentViewControllerDelegate
    
    func didUpdateContent(addContentViewController: AddContentViewController, content: Content) {
        contentArray.append(content)
        collectionView.reloadData()
    }
}
