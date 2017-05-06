//
//  GenericFilter.swift
//  Filterer
//
//  Created by MAURIZIO PIETRANTUONO on 28/04/17.
//  Copyright © 2017 UofT. All rights reserved.
//

public class GenericFilter: Filter {
    private let color: Color
    private var currentValue: Int
    private let startValue: Int

    public init(color: Color, value: Int) {
        self.color = color
        self.currentValue = value
        self.startValue = value
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
            pixel.red = UInt8(currentValue)
        case .BLUE:
            pixel.blue = UInt8(currentValue)
        case .GREEN:
            pixel.green = UInt8(currentValue)
        case .YELLOW:
            pixel.green = UInt8(currentValue)
            pixel.red = UInt8(currentValue)
        case .PURPLE:
            pixel.red = UInt8(currentValue)
            pixel.blue = UInt8(currentValue)
        case .SKY:
            pixel.green = UInt8(currentValue)
            pixel.blue = UInt8(currentValue)
        }
        return pixel
    }

    public func setIntensity(intensity: Float) -> Filter {
        currentValue = max(0, min(255, Int(Float(startValue) * intensity * 2)))
        return self
    }
}