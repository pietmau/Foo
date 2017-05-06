//
// Created by MAURIZIO PIETRANTUONO on 01/05/17.
// Copyright (c) 2017 UofT. All rights reserved.
//

import Foundation
import UIKit

class MyDataSource: NSObject, UICollectionViewDataSource {
    let filters: [String] = ["Red 0", "Red Max", "Blue 0", "Blue Max", "Green 0", "Green Max", "Yellow Max", "Yellow Min", "Purple Max", "Purple Min", "Sky Max", "Sky Min"]
    let defaultImage = UIKit.UIImage(named: "scenery")

    internal override init() {
    }

    public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filters.count
    }

    public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("foo", forIndexPath: indexPath) as! CollectionViewCell
        cell.imageView.image = Processor.getPredifinedFiltersByName(filters[indexPath.item]).apply(RGBAImage(image: defaultImage!)!).toUIImage()
        return cell
    }

}
