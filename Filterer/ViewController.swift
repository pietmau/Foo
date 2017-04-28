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
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var secondaryMenu: UIView!
    @IBOutlet var bottomMenu: UIView!
    @IBOutlet var filterButton: UIButton!

    @IBAction func onGreenSelected(sender: AnyObject) {
        imageView.image = Processor(image: imageView.image!).applyPredifinedFiltersByName("Green Max").run()
    }

    @IBAction func onRedSelected(sender: AnyObject) {
        imageView.image = Processor(image: imageView.image!).applyPredifinedFiltersByName("Red Max").run()
    }

    @IBAction func onBlueSelected(sender: AnyObject) {
        imageView.image = Processor(image: imageView.image!).applyPredifinedFiltersByName("Blue Max").run()
    }

    @IBAction func onYellowSelected(sender: AnyObject) {
        imageView.image = Processor(image: imageView.image!).applyPredifinedFiltersByName("Yellow Max").run()
    }

    @IBAction func onPurpleSelected(sender: AnyObject) {
        imageView.image = Processor(image: imageView.image!).applyPredifinedFiltersByName("Purple Max").run()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        secondaryMenu.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        secondaryMenu.translatesAutoresizingMaskIntoConstraints = false
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
            imageView.image = image
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
        view.addSubview(secondaryMenu)
        NSLayoutConstraint.activateConstraints(ConstrainMaker(secondaryMenu: secondaryMenu, bottomMenu: bottomMenu, view: view).makeConstraints())
        view.layoutIfNeeded()
        self.secondaryMenu.alpha = 0
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

}

