//
// Created by MAURIZIO PIETRANTUONO on 29/04/17.
// Copyright (c) 2017 UofT. All rights reserved.
//

import Foundation
import UIKit

class ImagePresenter {
    var originalImage: UIKit.UIImage?
    var filteredImage: UIKit.UIImage?
    let view: View

    internal init(view: View) {
        self.view = view
    }

    internal func setOriginalImage(originalImage: UIKit.UIImage) {
        self.originalImage = originalImage
        view.setOriginalImage(originalImage)
    }

    internal func setFilteredImage(filteredImage: UIKit.UIImage) {
        self.filteredImage = filteredImage
        view.setFilteredImage(filteredImage)
    }

    internal func onImagePicked(image: UIImage) {
        setOriginalImage(image)
    }

    internal func onCompareClicked(button: UIButton) {
        if (filteredImage == nil) {
            return
        }
        if (button.selected) {
            button.selected = false
            view.showFilteredImageView(true)
        } else {
            button.selected = true
            view.showFilteredImageView(false)
        }
    }

    internal func onRedSelected() {
        setAndShowUiFilteredImage(Processor(image: originalImage!).applyPredifinedFiltersByName("Red Max").run())
    }

    internal func onBlueSelected() {
        setAndShowUiFilteredImage(Processor(image: originalImage!).applyPredifinedFiltersByName("Blue Max").run())
    }

    internal func onYellowSelected() {
        setAndShowUiFilteredImage(Processor(image: originalImage!).applyPredifinedFiltersByName("Yellow Max").run())
    }

    internal func onGreenSelected() {
        setAndShowUiFilteredImage(Processor(image: originalImage!).applyPredifinedFiltersByName("Green Max").run())

    }

    internal func onPurpleSelected() {
        setAndShowUiFilteredImage(Processor(image: originalImage!).applyPredifinedFiltersByName("Red Max").run())
    }

    private func setAndShowUiFilteredImage(image: UIImage?) {
        setFilteredImage(image!)
        view.showFilteredImageView(true)
    }

    func onFilter(sender: UIButton) {
        if (sender.selected) {
            view.hideSecondaryMenu()
            sender.selected = false
        } else {
            view.showSecondaryMenu()
            sender.selected = true
        }
    }

}
