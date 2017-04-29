//
//  PredifinedFilters.swift
//  Filterer
//
//  Created by MAURIZIO PIETRANTUONO on 28/04/17.
//  Copyright © 2017 UofT. All rights reserved.
//


public struct PredifinedFilters {
    var predefined: [String: Filter]

    public init() {
        predefined = [:]
        predefined["Red 0"] = RedZero()
        predefined["Red Max"] = RedMax()
        predefined["Blue 0"] = BlueZero()
        predefined["Blue Max"] = BlueMax()
        predefined["Green 0"] = GreenZero()
        predefined["Green Max"] = GreenMax()
        predefined["Yellow Max"] = YellowMax()
        predefined["Purple Max"] = PurpleMax()
    }

    public func getPredifinedFilterbasedOnName(name: String) -> Filter {
        return predefined[name]!
    }

    class YellowMax: GenericFilter {
        init() {
            super.init(color: Color.YELLOW, value: 127)
        }
    }

    class PurpleMax: GenericFilter {
        init() {
            super.init(color: Color.PURPLE, value: 127)
        }
    }

    class RedZero: GenericFilter {
        init() {
            super.init(color: Color.RED, value: 0)
        }
    }

    class RedMax: GenericFilter {
        init() {
            super.init(color: Color.RED, value: 127)
        }
    }

    class BlueZero: GenericFilter {
        init() {
            super.init(color: Color.BLUE, value: 0)
        }
    }

    class BlueMax: GenericFilter {
        init() {
            super.init(color: Color.BLUE, value: 127)
        }
    }

    class GreenZero: GenericFilter {
        init() {
            super.init(color: Color.GREEN, value: 0)
        }
    }

    class GreenMax: GenericFilter {
        init() {
            super.init(color: Color.GREEN, value: 127)
        }
    }

}