//
// Created by MAURIZIO PIETRANTUONO on 28/04/17.
// Copyright (c) 2017 UofT. All rights reserved.
//

import Foundation
import UIKit

class Helper {

    public static func showSecondaryMenu(view: UIKit.UIView, secondaryMenu: UIView, bottomMenu: UIView) {
        view.addSubview(secondaryMenu)
        NSLayoutConstraint.activateConstraints(ConstrainMaker(secondaryMenu: secondaryMenu, bottomMenu: bottomMenu, view: view).makeConstraints())
        view.layoutIfNeeded()
        secondaryMenu.alpha = 0
        UIView.animateWithDuration(0.4) {
            secondaryMenu.alpha = 1.0
        }
    }

    public static func hideSecondaryMenu(secondaryMenu: UIKit.UIView) {
        UIView.animateWithDuration(0.4, animations: {
            secondaryMenu.alpha = 0
        }) { completed in
            if completed == true {
                secondaryMenu.removeFromSuperview()
            }
        }
    }
}
