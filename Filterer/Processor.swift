//
//  Processor.swift
//  Filterer
//
//  Created by MAURIZIO PIETRANTUONO on 28/04/17.
//  Copyright © 2017 UofT. All rights reserved.
//

import Foundation
import UIKit

public class Processor {

    private let image: RGBAImage

    public init(image: UIImage) {
        self.image = RGBAImage(image: image)!
    }

    var filters: [Filter] = []

    public func applyFilter(filter: Filter) {
        filters.append(filter)
    }

    public func run() -> UIImage? {
        var result = image

        for filter in filters {
            result = filter.apply(result)
        }
        return result.toUIImage()
    }

    public func applyPredifinedFiltersByName(filtername: String) -> Processor {
        applyFilter(PredifinedFilters().getPredifinedFilterbasedOnName(filtername))
        return self
    }

}

