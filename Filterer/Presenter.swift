//
// Created by MAURIZIO PIETRANTUONO on 29/04/17.
// Copyright (c) 2017 UofT. All rights reserved.
//

import Foundation
import UIKit

class ImagePresenter {

    var originalImageView: UIKit.UIImageView
    var filteredImageView: UIKit.UIImageView
    var mainView: UIKit.UIView

    var originalImage: UIKit.UIImage?
    var filteredImage: UIKit.UIImage?
    private var secondaryMenu: UIKit.UIView

    internal init(mainView: UIKit.UIView, originalImageView: UIKit.UIImageView, filteredImageView: UIKit.UIImageView, secondaryMenu: UIKit.UIView) {
        self.originalImageView = originalImageView
        self.filteredImageView = filteredImageView
        self.mainView = mainView
        self.secondaryMenu = secondaryMenu
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
            showFilteredImageView(true)
        } else {
            button.selected = true
            showFilteredImageView(false)
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

    private func showFilteredImageView(show: Bool) {
        if (show) {
            mainView.addSubview(filteredImageView)
            let topConstraint = filteredImageView.topAnchor.constraintEqualToAnchor(originalImageView.topAnchor)
            let bottomConstraint = filteredImageView.bottomAnchor.constraintEqualToAnchor(originalImageView.bottomAnchor)
            let leftConstraint = filteredImageView.leftAnchor.constraintEqualToAnchor(originalImageView.leftAnchor)
            let rightConstraint = filteredImageView.rightAnchor.constraintEqualToAnchor(originalImageView.rightAnchor)
            NSLayoutConstraint.activateConstraints([bottomConstraint, leftConstraint, rightConstraint, topConstraint])
            mainView.layoutIfNeeded()
            mainView.bringSubviewToFront(secondaryMenu)
        } else {
            filteredImageView.removeFromSuperview()
        }
    }
}
