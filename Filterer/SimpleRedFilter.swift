
//
//  SimpleRedFilter.swift
//  Filterer
//
//  Created by MAURIZIO PIETRANTUONO on 28/04/17.
//  Copyright © 2017 UofT. All rights reserved.
//

public class SimpleRedFilter: Filter {
    
    public init(){}
    
    public func apply(image:RGBAImage) -> RGBAImage{
        var ff = image;
        for x in 0..<ff.pixels.count{
            var pixel = ff.pixels[x];
            var value = (Int)(pixel.red);
            value=255;
            pixel.red = UInt8(value)
            ff.pixels[x]=pixel
        }
        return ff
    }
}

