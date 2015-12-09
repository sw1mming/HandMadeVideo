//
//  AddContentViewController.swift
//  HandMadeVideo
//
//  Created by Serg Melnik on 12/7/15.
//  Copyright © 2015 Serg Melnik. All rights reserved.
//

import UIKit
import Foundation

class AddContentViewController: UIViewController, AddContentViewDelegate {
    /* Property for AddContentViewControllerDelegate. */
    var delegate: AddContentViewControllerDelegate?
    
    /** Property for add content view. */
    var addContentView: AddContentView {
        return self.view as! AddContentView
    }

    override func viewDidLoad() {
        addContentView.delegate = self
        
        setupCancelButton()
    }
    
    
    // MARK: - Interface -
    
    func setupCancelButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: NSLocalizedString("Cancel", comment: "Add"),
            style: .Plain,
            target: self,
            action: Selector("cancelButton"))
    }
    
    func cancelButton() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    // MARK: - Delegates -
    // MARK: AddContentViewDelegate
    
    func didSelectSaveButton(addContentView: AddContentView, button: UIButton) {
        
        let content = Content()
        content.title = addContentView.titleTextField.text!
        
        delegate?.didUpdateContent(self, content: content)
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}


protocol AddContentViewControllerDelegate {
    func didUpdateContent(addContentViewController: AddContentViewController, content: Content)
}
