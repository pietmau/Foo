//
// Created by MAURIZIO PIETRANTUONO on 29/04/17.
// Copyright (c) 2017 UofT. All rights reserved.
//

import Foundation
import UIKit

protocol  View {
    func setOriginalImage(image: UIKit.UIImage)

    func setFilteredImage(image: UIImage)

    func showFilteredImageView(show: Bool)

    func hideSecondaryMenu()

    func showSecondaryMenu()


}
