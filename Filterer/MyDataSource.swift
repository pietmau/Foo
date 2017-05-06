//
// Created by MAURIZIO PIETRANTUONO on 01/05/17.
// Copyright (c) 2017 UofT. All rights reserved.
//

import Foundation
import UIKit

class MyDataSource: NSObject, UICollectionViewDataSource {
    private let defaultImage = UIKit.UIImage(named: "scenery")
    private let processor = Processor()

    internal override init() {
    }

    public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return processor.filterCount()
    }

    public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("foo", forIndexPath: indexPath) as! CollectionViewCell
        let filter = processor.getPredifinedFiltersByPosition(indexPath.item)
        cell.imageView.image = filter.apply(RGBAImage(image: defaultImage!)!).toUIImage()
        return cell
    }

}
