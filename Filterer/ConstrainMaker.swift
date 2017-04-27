//
//  ConstrainMaker.swift
//  Filterer
//
//  Created by MAURIZIO PIETRANTUONO on 27/04/17.
//  Copyright © 2017 UofT. All rights reserved.
//

import UIKit

class ConstrainMaker: NSObject {
    let secondaryMenu:UIView
    let bottomMenu:UIView
    let view: UIView
    
    internal init(secondaryMenu:UIView, bottomMenu:UIView, view: UIView) {
        self.secondaryMenu = secondaryMenu
        self.bottomMenu = bottomMenu
        self.view = view
    }
    
    internal func makeConstraints()-> [NSLayoutConstraint] {
        let bottomConstraint = secondaryMenu.bottomAnchor.constraintEqualToAnchor(bottomMenu.topAnchor)
        let leftConstraint = secondaryMenu.leftAnchor.constraintEqualToAnchor(view.leftAnchor)
        let rightConstraint = secondaryMenu.rightAnchor.constraintEqualToAnchor(view.rightAnchor)
        let heightConstraint = secondaryMenu.heightAnchor.constraintEqualToConstant(44)
        return [bottomConstraint, leftConstraint, rightConstraint, heightConstraint]
    }
}
