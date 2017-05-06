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
        case "Red Max": return RedMax()
        case "Blue Max": return BlueMax()
        case "Green Max": return GreenMax()
        case "Yellow Max": return YellowMax()
        case "Purple Max": return PurpleMax()
        case "Sky Max": return SkyMax()
        default:
            return nil
        }
    }

    public class YellowMax: GenericFilter {
        init() {
            super.init(color: Color.YELLOW, value: 127)
        }
    }

    public class PurpleMax: GenericFilter {
        init() {
            super.init(color: Color.PURPLE, value: 127)
        }
    }

    public class RedMax: GenericFilter {
        init() {
            super.init(color: Color.RED, value: 127)
        }
    }

    public class BlueMax: GenericFilter {
        init() {
            super.init(color: Color.BLUE, value: 127)
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
}