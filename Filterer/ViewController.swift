import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,
        ActionSheetWrapperDelegate, View {
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

    @IBAction func onCompareClick(sender: UIButton) {
        presenter.onCompareClick(sender)
    }

    @IBAction func onTouchUpInsideImage(sender: AnyObject) {
        if (!compareButton.selected) {
            presenter.onTouchUpInsideImage()
        }
    }

    @IBAction func onTouchDownImage(sender: AnyObject) {
        if (!compareButton.selected) {
            presenter.onTouchDownImage()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        filteredImageView.translatesAutoresizingMaskIntoConstraints = false
        presenter = ImagePresenter(view: self, originalImage: originalImageView.image!)
        collectionView.dataSource = dataSource
        collectionView.delegate = presenter
        let bar = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        bar.scrollDirection = UICollectionViewScrollDirection.Horizontal
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
        showView(collectionView, show: show)
    }

    func showFilteredImageView(show: Bool) {
        showView(filteredImageView, show: show)
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
        showView(slider, show: show)
    }

    func showView(view: UIView, show: Bool) {
        if (show) {
            view.hidden = false
            view.alpha = 0
            UIView.animateWithDuration(0.4) {
                view.alpha = 1.0
            }
        } else {
            UIView.animateWithDuration(0.4, animations: {
                view.alpha = 0
            }) { completed in
                if completed == true {
                    view.hidden = true
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

