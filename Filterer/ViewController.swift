//
//  ViewController.swift
//  Filterer
//
//  Created by Jack on 2015-09-22.
//  Copyright © 2015 UofT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, ActionSheetWrapperDelegate, View {

    var presenter: ImagePresenter!

    let dataSource = MyDataSource()

    @IBOutlet var bottomMenu: UIView!
    @IBOutlet var filterButton: UIButton!
    @IBOutlet var compareButton: UIButton!
    @IBOutlet var editButton: UIButton!
    @IBOutlet var slider: UISlider!

    @IBOutlet var originalImageView: UIImageView!
    @IBOutlet var filteredImageView: UIImageView!

    @IBOutlet var collectionView: UICollectionView!

    @IBAction func onSliderMove(sender: UISlider) {
        presenter.onSliderMove(sender.value)
    }

    @IBAction func onEditClicked(sender: UIButton) {
        presenter.onEditClicked(sender)
    }

    @IBAction func onCompareClickUp(sender: UIButton) {
        presenter.onCompareClickUp(sender)
    }

    @IBAction func onCompareClickDown(sender: UIButton) {
        presenter.onCompareClickDown(sender)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        filteredImageView.translatesAutoresizingMaskIntoConstraints = false
        presenter = ImagePresenter(view: self, originalImage: originalImageView.image!)
        collectionView.dataSource = dataSource
        collectionView.delegate = presenter
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        collectionView.collectionViewLayout = layout
    }

    func setOriginalImage(image: UIKit.UIImage) {
        originalImageView.image = image
    }

    func setFilteredImage(image: UIImage) {
        filteredImageView.image = image
    }

    // MARK: Share
    @IBAction func onShare(sender: AnyObject) {
        let activityController =
                UIActivityViewController(activityItems:
                ["Check out our really cool app", originalImageView.image!], applicationActivities: nil)
        presentViewController(activityController, animated: true, completion: nil)
    }

    // MARK: New Photo
    @IBAction func onNewPhoto(sender: AnyObject) {
        presentViewController(ActionSheetWrapper(delegate: self).getSheet(), animated: true, completion: nil)
    }

    func showCamera() {// TODO check if on emulator
        let cameraPicker = CameraPicker(delegate: self)
        presentViewController(cameraPicker, animated: true, completion: nil)
    }

    func showAlbum() {
        let cameraPicker = PhotoLibraryPicker(delegate: self)
        presentViewController(cameraPicker, animated: true, completion: nil)
    }

    // MARK: UIImagePickerControllerDelegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: AnyObject]) {
        dismissViewControllerAnimated(true, completion: nil)
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            presenter!.onImagePicked(image)
        }
    }

    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    // MARK: Filter Menu
    @IBAction func onFilter(sender: UIButton) {
        presenter.onFilter(sender)
    }

    func showCollectionView(show: Bool) {
        if (show) { //TODO use autolyout
            collectionView.hidden = false
            collectionView.alpha = 0
            UIView.animateWithDuration(0.4) {
                self.collectionView.alpha = 1.0
            }
        } else {
            UIView.animateWithDuration(0.4, animations: {
                self.collectionView.alpha = 0
            }) { completed in
                if completed == true {
                    self.collectionView.hidden = true
                }
            }
        }
    }

    func showFilteredImageView(show: Bool) {
        if (show) { //TODO use autolyout
            filteredImageView.hidden = false
            filteredImageView.alpha = 0
            UIView.animateWithDuration(0.4) {
                self.filteredImageView.alpha = 1.0
            }
        } else {
            UIView.animateWithDuration(0.4, animations: {
                self.filteredImageView.alpha = 0
            }) { completed in
                if completed == true {
                    self.filteredImageView.hidden = true
                }
            }
        }
    }

    func setCompareButtonSelected(selected: Bool) {
        compareButton!.selected = selected
    }

    func setCompareButtonEnabled(enabled: Bool) {
        compareButton!.enabled = enabled
    }

    func setEditButtonEnabled(enabled: Bool) {
        editButton.enabled = enabled
    }

    func showSlider(show: Bool) {
        if (show) {//TODO use hidden
            slider.hidden = false
            slider.alpha = 0
            UIView.animateWithDuration(0.4) {
                self.slider.alpha = 1.0
            }
        } else {
            UIView.animateWithDuration(0.4, animations: {
                self.slider.alpha = 0
            }) { completed in
                if completed == true {
                    self.slider.hidden = true
                }
            }
        }
    }

    internal func resetSlider() {
        slider.value = 0.5
    }

    func setEditButtonSelected(selected: Bool) {
        editButton.selected = selected
    }

    func setFilterButtonSelected(selected: Bool) {
        filterButton.selected = selected
    }
}

