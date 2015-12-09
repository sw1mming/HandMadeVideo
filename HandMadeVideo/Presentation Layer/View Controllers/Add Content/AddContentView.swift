//
//  AddContentView.swift
//  HandMadeVideo
//
//  Created by Serg Melnik on 12/7/15.
//  Copyright © 2015 Serg Melnik. All rights reserved.
//

import UIKit
import Foundation

class AddContentView: UIView {
    /* Text field for title of Content. */
    @IBOutlet weak var titleTextField: UITextField!
    
    /* Outlet for save button. */
    @IBOutlet weak var saveButton: UIButton!
    
    /* Property for AddContentViewDelegate. */
    var delegate: AddContentViewDelegate?
    
    @IBAction private func saveButtonSelected(sender: AnyObject) {
        delegate?.didSelectSaveButton(self, button: sender as! UIButton)
    }
}


protocol AddContentViewDelegate {
    func didSelectSaveButton(addContentView: AddContentView, button: UIButton)
}
