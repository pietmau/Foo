//
// Created by MAURIZIO PIETRANTUONO on 28/04/17.
// Copyright (c) 2017 UofT. All rights reserved.
//

import UIKit
import Foundation

class CameraPicker: UIImagePickerController {

    convenience init(delegate: protocol<UIImagePickerControllerDelegate, UINavigationControllerDelegate>) {
        self.init()
        self.delegate = delegate
        self.sourceType = .Camera
    }

}
