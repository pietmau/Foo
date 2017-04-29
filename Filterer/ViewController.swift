//
//  ViewController.swift
//  Filterer
//
//  Created by Jack on 2015-09-22.
//  Copyright © 2015 UofT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, ActionSheetWrapperDelegate, View {
    var imagePresenter: ImagePresenter!
    @IBOutlet var secondaryMenu: UIView!
    @IBOutlet var bottomMenu: UIView!
    @IBOutlet var filterButton: UIButton!
    @IBOutlet var compareButton: UIButton!

    @IBOutlet var redButton: UIButton!
    @IBOutlet var greenButton: UIButton!
    @IBOutlet var blueButton: UIButton!
    @IBOutlet var yellowButton: UIButton!
    @IBOutlet var purpleButton: UIButton!

    @IBOutlet var originalImageView: UIImageView!
    @IBOutlet var filteredImageView: UIImageView!

    @IBOutlet var label: UILabel!

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

    @IBAction func onPurpleSelected(sender: UIButton) {
        imagePresenter!.onPurpleSelected()
    }

    @IBAction func onCompareClickUp(sender: UIButton) {
        imagePresenter.onCompareClickUp(sender)
    }

    @IBAction func onCompareClickDown(sender: UIButton) {
        imagePresenter.onCompareClickDown(sender)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        secondaryMenu.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        secondaryMenu.translatesAutoresizingMaskIntoConstraints = false
        filteredImageView.translatesAutoresizingMaskIntoConstraints = false
        imagePresenter = ImagePresenter(view: self, originalImage: originalImageView.image!)
        colorizeButtons()
    }

    func setOriginalImage(image: UIKit.UIImage) {
        originalImageView.image = image
    }

    private func colorizeButtons() {
        var image = UIKit.UIImage(named: "Icon-App-40x40")
        redButton.setImage(Processor(image: image!).applyPredifinedFiltersByName("Red Max").run(), forState: .Normal)
        image = UIKit.UIImage(named: "Icon-App-40x40")
        greenButton.setImage(Processor(image: image!).applyPredifinedFiltersByName("Green Max").run(), forState: .Normal)
        image = UIKit.UIImage(named: "Icon-App-40x40")
        blueButton.setImage(Processor(image: image!).applyPredifinedFiltersByName("Blue Max").run(), forState: .Normal)
        image = UIKit.UIImage(named: "Icon-App-40x40")
        yellowButton.setImage(Processor(image: image!).applyPredifinedFiltersByName("Yellow Max").run(), forState: .Normal)
        image = UIKit.UIImage(named: "Icon-App-40x40")
        var new = Processor(image: image!).applyPredifinedFiltersByName("Purple Max").run()
        purpleButton.setImage(Processor(image: image!).applyPredifinedFiltersByName("Purple Max").run(), forState: .Normal)
    }

    func setFilteredImage(image: UIImage) {
        filteredImageView.image = image
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
        imagePresenter.onFilter(sender)
    }

    func showSecondaryMenu() {
        view.addSubview(secondaryMenu)
        let bottomConstraint = secondaryMenu.bottomAnchor.constraintEqualToAnchor(bottomMenu.topAnchor)
        let leftConstraint = secondaryMenu.leftAnchor.constraintEqualToAnchor(view.leftAnchor)
        let rightConstraint = secondaryMenu.rightAnchor.constraintEqualToAnchor(view.rightAnchor)
        let heightConstraint = secondaryMenu.heightAnchor.constraintEqualToConstant(44)
        NSLayoutConstraint.activateConstraints([bottomConstraint, leftConstraint, rightConstraint, heightConstraint])
        view.layoutIfNeeded()
        secondaryMenu.alpha = 0
        UIView.animateWithDuration(0.4) {
            self.secondaryMenu.alpha = 1.0
        }
    }

    func hideSecondaryMenu() {
        UIView.animateWithDuration(0.4, animations: {
            self.secondaryMenu.alpha = 0
        }) { completed in
            if completed == true {
                self.secondaryMenu.removeFromSuperview()
            }
        }
    }

    func showFilteredImageView(show: Bool) {
        if (show) { //TODO use autolyout
            view.addSubview(filteredImageView)
            let topConstraint = filteredImageView.topAnchor.constraintEqualToAnchor(originalImageView.topAnchor)
            let bottomConstraint = filteredImageView.bottomAnchor.constraintEqualToAnchor(originalImageView.bottomAnchor)
            let leftConstraint = filteredImageView.leftAnchor.constraintEqualToAnchor(originalImageView.leftAnchor)
            let rightConstraint = filteredImageView.rightAnchor.constraintEqualToAnchor(originalImageView.rightAnchor)
            NSLayoutConstraint.activateConstraints([bottomConstraint, leftConstraint, rightConstraint, topConstraint])
            view.layoutIfNeeded()
            view.bringSubviewToFront(secondaryMenu)
            filteredImageView.alpha = 0
            UIView.animateWithDuration(0.4) {
                self.filteredImageView.alpha = 1.0
            }
        } else {
            UIView.animateWithDuration(0.4, animations: {
                self.filteredImageView.alpha = 0
            }) { completed in
                if completed == true {
                    self.filteredImageView.removeFromSuperview()
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
}

