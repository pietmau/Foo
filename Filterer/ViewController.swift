//
//  ViewController.swift
//  Filterer
//
//  Created by Jack on 2015-09-22.
//  Copyright © 2015 UofT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, ActionSheetWrapperDelegate {
    var imagePresenter: ImagePresenter?
    @IBOutlet var secondaryMenu: UIView!
    @IBOutlet var bottomMenu: UIView!
    @IBOutlet var filterButton: UIButton!

    @IBOutlet var originalImageView: UIImageView!
    @IBOutlet var filteredImageView: UIImageView!

    @IBAction func onGreenSelected(sender: AnyObject) {
        imagePresenter!.onGreenSelected()
    }

    @IBAction func onRedSelected(sender: AnyObject) {
        imagePresenter!.onRedSelected()
    }

    @IBAction func onBlueSelected(sender: AnyObject) {
        imagePresenter!.onBlueSelected()
    }

    @IBAction func onYellowSelected(sender: AnyObject) {
        imagePresenter!.onYellowSelected()
    }

    @IBAction func onPurpleSelected(sender: AnyObject) {
        imagePresenter!.onPurpleSelected()
    }

    @IBAction func onCompareClicked(sender: UIButton) {
        imagePresenter!.onCompareClicked(sender)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        secondaryMenu.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        secondaryMenu.translatesAutoresizingMaskIntoConstraints = false
        filteredImageView.translatesAutoresizingMaskIntoConstraints = false
        imagePresenter = ImagePresenter(mainView: view, originalImageView: originalImageView, filteredImageView: filteredImageView, secondaryMenu: secondaryMenu)
        imagePresenter!.setOriginalImage(originalImageView.image!)
    }

    // MARK: Share
    @IBAction func onShare(sender: AnyObject) {
        let activityController = UIActivityViewController(activityItems: ["Check out our really cool app", originalImageView.image!], applicationActivities: nil)
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
            imagePresenter!.onImagePicked(image)
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

}

