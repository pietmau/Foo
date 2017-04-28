//
//  GenericFilter.swift
//  Filterer
//
//  Created by MAURIZIO PIETRANTUONO on 28/04/17.
//  Copyright © 2017 UofT. All rights reserved.
//

public class GenericFilter: Filter {
    private let color: Color
    private let value: Int

    public init(color: Color, value: Int) {
        self.color = color
        self.value = value
    }

    public func apply(image: RGBAImage) -> RGBAImage {
        var result = image
        for x in 0..<result.pixels.count {
            var pixel = result.pixels[x];
            let component = getColorComponent(&pixel)
            result.pixels[x] = component
        }

        return result
    }

    private func getColorComponent(inout pixel: Pixel) -> Pixel {
        switch color {
        case .RED:
            pixel.red = UInt8(value)
        case .BLUE:
            pixel.blue = UInt8(value)
        case .GREEN:
            pixel.green = UInt8(value)
        case .YELLOW:
            pixel.green = UInt8(value)
            pixel.red = UInt8(value)
        case .PURPLE:
            pixel.red = UInt8(value)
            pixel.blue = UInt8(value)
        }
        return pixel

    }
}