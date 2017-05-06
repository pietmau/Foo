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
    private var filters: [Filter] = []
    private let filtersNames: [String] = ["Red Max", "Blue Max", "Green Max", "Yellow Max", "Purple Max", "Sky Max",
                                          "Red Max", "Blue Max", "Green Max", "Yellow Max", "Purple Max", "Sky Max"]
    private let image: RGBAImage?
    private let predefinedFilters = PredifinedFilters()

    public init(image: UIImage) {
        self.image = RGBAImage(image: image)!
    }

    public init() {
        image = nil
    }

    internal func applyFilter(filter: Filter) {
        filters.append(filter)
    }

    internal func run() -> UIImage? {
        var result = image!
        for filter in filters {
            result = filter.apply(result)
        }
        return result.toUIImage()
    }

    internal func applyPredifinedFiltersByName(filtername: String) -> Processor {
        applyFilter(predefinedFilters.getPredifinedFilterbasedOnName(filtername))
        return self
    }

    internal func getPredifinedFiltersByName(filtername: String) -> Filter {
        return predefinedFilters.getPredifinedFilterbasedOnName(filtername)
    }

    internal func getPredifinedFiltersByPosition(position: Int) -> Filter {
        return predefinedFilters.getPredifinedFilterbasedOnName(filtersNames[position])
    }

    internal func filterCount() -> Int {
        return filtersNames.count
    }
}

