//
// Created by MAURIZIO PIETRANTUONO on 29/04/17.
// Copyright (c) 2017 UofT. All rights reserved.
//

import Foundation
import UIKit

class ImagePresenter {
    var originalImageView: UIKit.UIImageView
    var filteredImageView: UIKit.UIImageView

    var originalImage: UIKit.UIImage?
    var filteredImage: UIKit.UIImage?

    internal init(originalImageView: UIKit.UIImageView, filteredImageView: UIKit.UIImageView) {
        self.originalImageView = originalImageView
        self.filteredImageView = filteredImageView
        //self.filteredImageView.hidden = true
    }

    internal func setOriginalImage(originalImage: UIKit.UIImage) {
        self.originalImage = originalImage
        originalImageView.image = originalImage
    }

    internal func setFilteredImage(filteredImage: UIKit.UIImage) {
        self.filteredImage = filteredImage
        filteredImageView.image = filteredImage
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
            //showImage(filteredImage!)
        } else {
            button.selected = true
            //button(originalImage!)
        }

    }

    internal func onRedSelected() {
        setAndShowUiFilteredImage(Processor(image: originalImageView.image!).applyPredifinedFiltersByName("Red Max").run())
    }

    internal func onBlueSelected() {
        setAndShowUiFilteredImage(Processor(image: originalImageView.image!).applyPredifinedFiltersByName("Blue Max").run())
    }

    internal func onYellowSelected() {
        setAndShowUiFilteredImage(Processor(image: originalImageView.image!).applyPredifinedFiltersByName("Yellow Max").run())
    }

    internal func onGreenSelected() {
        setAndShowUiFilteredImage(Processor(image: originalImageView.image!).applyPredifinedFiltersByName("Green Max").run())

    }

    internal func onPurpleSelected() {
        setAndShowUiFilteredImage(Processor(image: originalImageView.image!).applyPredifinedFiltersByName("Red Max").run())
    }

    private func setAndShowUiFilteredImage(image: UIImage?) {
        setFilteredImage(image!)
        showFilteredImageView(true)
    }

    private func showFilteredImageView(hidden: Bool) {
        //filteredImageView.hidden = !hidden
    }
}
