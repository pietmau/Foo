//
// Created by MAURIZIO PIETRANTUONO on 01/05/17.
// Copyright (c) 2017 UofT. All rights reserved.
//

import Foundation
import UIKit

class MyDataSource: NSObject, UICollectionViewDataSource   {
    
    internal override init(){}

    public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1000
    }

    public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        return collectionView.dequeueReusableCellWithReuseIdentifier("foo", forIndexPath: indexPath)
    }

}
