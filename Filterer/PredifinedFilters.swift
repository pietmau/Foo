//
//  PredifinedFilters.swift
//  Filterer
//
//  Created by MAURIZIO PIETRANTUONO on 28/04/17.
//  Copyright © 2017 UofT. All rights reserved.
//


public struct PredifinedFilters {

    public init() {

    }

    public func getPredifinedFilterbasedOnName(name: String) -> Filter! {
        switch name {
        case "Red 0": return RedZero()
        case "Red Max": return RedMax()
        case "Blue 0": return BlueZero()
        case "Blue Max": return BlueMax()
        case "Green 0": return GreenZero()
        case "Green Max": return GreenMax()
        case "Yellow Max": return YellowMax()
        case "Yellow Min": return YellowMin()
        case "Purple Max": return PurpleMax()
        case "Purple Min": return PurpleMin()
        case "Sky Max": return SkyMax()
        case "Sky Min": return SkyMin()
        default:
            return nil
        }
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