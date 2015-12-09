//
//  UIView+LoadFromNib.swift
//  HandMadeVideo
//
//  Created by Serg Melnik on 12/9/15.
//  Copyright © 2015 Serg Melnik. All rights reserved.
//

import UIKit
import Foundation

extension UIView {
    
    static func className () -> String {
        return NSStringFromClass(self).componentsSeparatedByString(".").last! as String
    }

    static var cellIdentifier: String {
        return className()
    }

    static func nib () -> UINib {
        return UINib.init(nibName: className(), bundle: nil)
    }
}
