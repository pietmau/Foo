//
// Created by MAURIZIO PIETRANTUONO on 28/04/17.
// Copyright (c) 2017 UofT. All rights reserved.
//

import Foundation
import UIKit

class Helper {

    internal static func showSecondaryMenu(view: UIKit.UIView, secondaryMenu: UIView, bottomMenu: UIView) {
        view.addSubview(secondaryMenu)
        let bottomConstraint = secondaryMenu.bottomAnchor.constraintEqualToAnchor(bottomMenu.topAnchor)
        let leftConstraint = secondaryMenu.leftAnchor.constraintEqualToAnchor(view.leftAnchor)
        let rightConstraint = secondaryMenu.rightAnchor.constraintEqualToAnchor(view.rightAnchor)
        let heightConstraint = secondaryMenu.heightAnchor.constraintEqualToConstant(44)
        NSLayoutConstraint.activateConstraints([bottomConstraint, leftConstraint, rightConstraint, heightConstraint])
        view.layoutIfNeeded()
        secondaryMenu.alpha = 0
        UIView.animateWithDuration(0.4) {
            secondaryMenu.alpha = 1.0
        }
    }

    internal static func hideSecondaryMenu(secondaryMenu: UIKit.UIView) {
        UIView.animateWithDuration(0.4, animations: {
            secondaryMenu.alpha = 0
        }) { completed in
            if completed == true {
                secondaryMenu.removeFromSuperview()
            }
        }
    }
}
