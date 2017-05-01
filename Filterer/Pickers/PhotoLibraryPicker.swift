//
// Created by MAURIZIO PIETRANTUONO on 28/04/17.
// Copyright (c) 2017 UofT. All rights reserved.
//

import Foundation
import UIKit

class PhotoLibraryPicker: UIImagePickerController {

    convenience init(delegate: protocol<UIImagePickerControllerDelegate, UINavigationControllerDelegate>) {
        self.init()
        self.delegate = delegate
        self.sourceType = .PhotoLibrary
    }
}
