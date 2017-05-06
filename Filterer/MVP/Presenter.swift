//
// Created by MAURIZIO PIETRANTUONO on 29/04/17.
// Copyright (c) 2017 UofT. All rights reserved.
//

import Foundation
import UIKit

class ImagePresenter: NSObject, UICollectionViewDelegate {
    private var originalImage: UIKit.UIImage?
    private var filteredImage: UIKit.UIImage?
    private let view: View
    private var currentFilter: Filter?
    private let processor = Processor()

    init(view: View, originalImage: UIKit.UIImage) {
        self.view = view
        super.init()
        setOriginalImage(originalImage)
    }

    func setOriginalImage(originalImage: UIKit.UIImage) {
        self.originalImage = originalImage
        view.setOriginalImage(originalImage)
    }

    func setFilteredImage(filteredImage: UIKit.UIImage) {
        self.filteredImage = filteredImage
        view.setFilteredImage(filteredImage)
    }

    func onImagePicked(image: UIImage) {
        setOriginalImage(image)
        view.showFilteredImageView(false)
        view.showCollectionView(false)
        view.showSlider(false)
        view.setCompareButtonEnabled(false)
        view.setCompareButtonEnabled(false)
        view.setEditButtonEnabled(false)
        view.setEditButtonEnabled(false)
        currentFilter = nil
    }

    func onCompareClicked(button: UIButton) {
        if (button.selected) {
            view.setCompareButtonSelected(false)
            view.showFilteredImageView(true)
        } else {
            view.setCompareButtonSelected(true)
            view.showFilteredImageView(false)
        }
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
            view.showCollectionView(false)
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
            view.showCollectionView(false)
            view.showSlider(true)
        }
    }

    func onSliderMove(value: Float) {
        currentFilter = currentFilter!.setIntensity(value)
        setFilteredImage(currentFilter!.apply(RGBAImage(image: originalImage!)!).toUIImage()!)
    }

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        view.resetSlider()
        currentFilter = processor.getPredifinedFiltersByPosition(indexPath.item)
        setAndShowUiFilteredImage(currentFilter!.apply(RGBAImage(image: originalImage!)!).toUIImage())
    }
}
