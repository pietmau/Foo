//
//  PredifinedFilters.swift
//  Filterer
//
//  Created by MAURIZIO PIETRANTUONO on 28/04/17.
//  Copyright © 2017 UofT. All rights reserved.
//


public struct PredifinedFilters {
    var predefined: [String: Filter] = [:]

    public init() {
        predefined["Red 0"] = RedZero()
        predefined["Red Max"] = RedMax()
        predefined["Blue 0"] = BlueZero()
        predefined["Blue Max"] = BlueMax()
        predefined["Green 0"] = GreenZero()
        predefined["Green Max"] = GreenMax()
        predefined["Yellow Max"] = YellowMax()
        predefined["Yellow Min"] = YellowMin()
        predefined["Purple Max"] = PurpleMax()
        predefined["Purple Min"] = PurpleMin()
        predefined["Sky Max"] = SkyMax()
        predefined["Sky Min"] = SkyMin()
    }

    public func getPredifinedFilterbasedOnName(name: String) -> Filter {
        return predefined[name]!
    }

    public class YellowMax: GenericFilter {
        init() {
            super.init(color: Color.YELLOW, value: 127)
        }
    }

    public class YellowMin: GenericFilter {
        init() {
            super.init(color: Color.YELLOW, value: 0)
        }
    }

    public class PurpleMax: GenericFilter {
        init() {
            super.init(color: Color.PURPLE, value: 127)
        }
    }

    public class PurpleMin: GenericFilter {
        init() {
            super.init(color: Color.PURPLE, value: 0)
        }
    }

    public class RedZero: GenericFilter {
        init() {
            super.init(color: Color.RED, value: 0)
        }
    }

    public class RedMax: GenericFilter {
        init() {
            super.init(color: Color.RED, value: 127)
        }
    }

    public class BlueZero: GenericFilter {
        init() {
            super.init(color: Color.BLUE, value: 0)
        }
    }

    public class BlueMax: GenericFilter {
        init() {
            super.init(color: Color.BLUE, value: 127)
        }
    }

    public class GreenZero: GenericFilter {
        init() {
            super.init(color: Color.GREEN, value: 0)
        }
    }

    public class GreenMax: GenericFilter {
        init() {
            super.init(color: Color.GREEN, value: 127)
        }
    }

    public class SkyMax: GenericFilter {
        init() {
            super.init(color: Color.SKY, value: 127)
        }
    }

    public class SkyMin: GenericFilter {
        init() {
            super.init(color: Color.SKY, value: 0)
        }
    }

}