//
//  ActionSheetContainer.swift
//  Filterer
//
//  Created by MAURIZIO PIETRANTUONO on 28/04/17.
//  Copyright © 2017 UofT. All rights reserved.
//

import UIKit

class ActionSheetWrapper {
    var actionSheet: UIAlertController

    init(delegate: ActionSheetWrapperDelegate) {
        actionSheet = UIAlertController(title: "New Photo", message: nil, preferredStyle: .ActionSheet)
        if (UIImagePickerController.isSourceTypeAvailable(.Camera)) {
            actionSheet.addAction(UIAlertAction(title: "Camera", style: .Default, handler: { action in
                delegate.showCamera()
            }))
        }
        actionSheet.addAction(UIAlertAction(title: "Album", style: .Default, handler: { action in
            delegate.showAlbum()
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
    }

    func getSheet() -> UIAlertController {
        return actionSheet
    }

}

protocol ActionSheetWrapperDelegate {
    func showCamera()

    func showAlbum()

}