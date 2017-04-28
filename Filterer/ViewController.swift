//
//  ViewController.swift
//  Filterer
//
//  Created by Jack on 2015-09-22.
//  Copyright © 2015 UofT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, ActionSheetWrapperDelegate {
    var filteredImage: UIImage?
    var originalImage: UIImage?
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var secondaryMenu: UIView!
    @IBOutlet var bottomMenu: UIView!
    @IBOutlet var filterButton: UIButton!

    @IBAction func onGreenSelected(sender: AnyObject) {
        setUiFilteredImage(Processor(image: imageView.image!).applyPredifinedFiltersByName("Green Max").run())
    }

    @IBAction func onRedSelected(sender: AnyObject) {
        setUiFilteredImage(Processor(image: imageView.image!).applyPredifinedFiltersByName("Red Max").run())
    }

    @IBAction func onBlueSelected(sender: AnyObject) {
        setUiFilteredImage(Processor(image: imageView.image!).applyPredifinedFiltersByName("Blue Max").run())
    }

    @IBAction func onYellowSelected(sender: AnyObject) {
        setUiFilteredImage(Processor(image: imageView.image!).applyPredifinedFiltersByName("Yellow Max").run())
    }

    @IBAction func onPurpleSelected(sender: AnyObject) {
        setUiFilteredImage(Processor(image: imageView.image!).applyPredifinedFiltersByName("Red Max").run())
    }

    @IBAction func onCompareClicked(sender: UIButton) {
        if (filteredImage == nil) {
            return
        }
        if (sender.selected) {
            sender.selected = false
            showImage(filteredImage!)
        } else {
            sender.selected = true
            showImage(originalImage!)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        secondaryMenu.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        secondaryMenu.translatesAutoresizingMaskIntoConstraints = false
        originalImage = imageView.image
    }

    // MARK: Share
    @IBAction func onShare(sender: AnyObject) {
        let activityController = UIActivityViewController(activityItems: ["Check out our really cool app", imageView.image!], applicationActivities: nil)
        presentViewController(activityController, animated: true, completion: nil)
    }

    // MARK: New Photo
    @IBAction func onNewPhoto(sender: AnyObject) {
        presentViewController(ActionSheetWrapper(delegate: self).getSheet(), animated: true, completion: nil)
    }

    func showCamera() {
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
            setOriginalImage(image)
        }
    }

    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    // MARK: Filter Menu
    @IBAction func onFilter(sender: UIButton) {
        if (sender.selected) {
            hideSecondaryMenu()
            sender.selected = false
        } else {
            showSecondaryMenu()
            sender.selected = true
        }
    }

    func showSecondaryMenu() {
        Helper.showSecondaryMenu(view, secondaryMenu: secondaryMenu, bottomMenu: bottomMenu)
    }

    func hideSecondaryMenu() {
        Helper.hideSecondaryMenu(secondaryMenu)
    }

    private func setOriginalImage(image: UIImage) {
        originalImage = image
        showImage(originalImage!)
    }

    func setUiFilteredImage(image: UIImage?) {
        if let unwrapped = image {
            filteredImage = unwrapped
            showImage(filteredImage!)
        }
    }

    func showImage(image: UIImage) {
        imageView.image = image

    }
}

