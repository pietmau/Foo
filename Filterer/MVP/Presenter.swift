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
    private var currentFilter: String?

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
        view.resetSlider()
        currentFilter = "Red Max"
        setAndShowUiFilteredImage(PredifinedFilters().getPredifinedFilterbasedOnName(currentFilter!).apply(RGBAImage(image: originalImage!)!).toUIImage())
    }

    internal func onBlueSelected() {
        view.resetSlider()
        currentFilter = "Blue Max"
        setAndShowUiFilteredImage(PredifinedFilters().getPredifinedFilterbasedOnName(currentFilter!).apply(RGBAImage(image: originalImage!)!).toUIImage())
    }

    internal func onYellowSelected() {
        view.resetSlider()
        currentFilter = "Yellow Max"
        setAndShowUiFilteredImage(PredifinedFilters().getPredifinedFilterbasedOnName(currentFilter!).apply(RGBAImage(image: originalImage!)!).toUIImage())
    }

    internal func onGreenSelected() {
        view.resetSlider()
        currentFilter = "Green Max"
        setAndShowUiFilteredImage(PredifinedFilters().getPredifinedFilterbasedOnName(currentFilter!).apply(RGBAImage(image: originalImage!)!).toUIImage())
    }

    internal func onPurpleSelected() {
        view.resetSlider()
        currentFilter = "Purple Max"
        setAndShowUiFilteredImage(PredifinedFilters().getPredifinedFilterbasedOnName(currentFilter!).apply(RGBAImage(image: originalImage!)!).toUIImage())
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
            view.showCollectionView(true)
            sender.selected = false
        } else {
            view.showCollectionView(true)
            view.setEditButtonSelected(false)
            view.showSlider(false)
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
            view.setFilterButtonSelected(false)
            view.showCollectionView(true)
            view.showSlider(true)
        }
    }

    func onSliderMove(value: Float) {
        setFilteredImage(PredifinedFilters().getPredifinedFilterbasedOnName(currentFilter!).setIntensity(value).apply(RGBAImage(image: originalImage!)!).toUIImage()!)
    }
}
