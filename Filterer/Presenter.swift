//
// Created by MAURIZIO PIETRANTUONO on 29/04/17.
// Copyright (c) 2017 UofT. All rights reserved.
//

import Foundation
import UIKit

class ImagePresenter {
    private var originalImage: UIKit.UIImage?
    private var filteredImage: UIKit.UIImage?
    private let view: View
    private var currentFilter: Filter?

    internal init(view: View, originalImage: UIKit.UIImage) {
        self.view = view
        setOriginalImage(originalImage)
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
        if (button.selected) {
            view.setCompareButtonSelected(false)
            view.showFilteredImageView(true)
        } else {
            view.setCompareButtonSelected(true)
            view.showFilteredImageView(false)
        }
    }

    internal func onRedSelected() {
        currentFilter = PredifinedFilters().getPredifinedFilterbasedOnName("Red Max")
        setAndShowUiFilteredImage(currentFilter!.apply(RGBAImage(image: originalImage!)!).toUIImage())
    }

    internal func onBlueSelected() {
        currentFilter = PredifinedFilters().getPredifinedFilterbasedOnName("Blue Max")
        setAndShowUiFilteredImage(currentFilter!.apply(RGBAImage(image: originalImage!)!).toUIImage())
    }

    internal func onYellowSelected() {
        currentFilter = PredifinedFilters().getPredifinedFilterbasedOnName("Yellow Max")
        setAndShowUiFilteredImage(currentFilter!.apply(RGBAImage(image: originalImage!)!).toUIImage())
    }

    internal func onGreenSelected() {
        currentFilter = PredifinedFilters().getPredifinedFilterbasedOnName("Green Max")
        setAndShowUiFilteredImage(currentFilter!.apply(RGBAImage(image: originalImage!)!).toUIImage())
    }

    internal func onPurpleSelected() {
        currentFilter = PredifinedFilters().getPredifinedFilterbasedOnName("Purple Max")
        setAndShowUiFilteredImage(currentFilter!.apply(RGBAImage(image: originalImage!)!).toUIImage())
    }

    private func setAndShowUiFilteredImage(image: UIImage?) {
        setFilteredImage(image!)
        view.showFilteredImageView(true)
        view.setCompareButtonEnabled(true)
        view.setEditButtonEnabled(true)
        view.setCompareButtonSelected(false)
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

    func onCompareClickUp(sender: UIButton) {
        sender.selected = false
        view.showFilteredImageView(true)
    }

    func onCompareClickDown(sender: UIButton) {
        sender.selected = true
        view.showFilteredImageView(false)
    }

    func onEditClicked(sender: UIButton) {
        if (sender.selected) {
            sender.selected = false
            view.showSlider(false)
        } else {
            sender.selected = true
            view.showSlider(true)
        }
    }

    func onSliderMove(value: Float) {
        setFilteredImage(currentFilter!.setIntensity(value).apply(RGBAImage(image: originalImage!)!).toUIImage()!)
    }


}
