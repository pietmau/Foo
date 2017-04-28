//
//  Filter.swift
//  Filterer
//
//  Created by MAURIZIO PIETRANTUONO on 28/04/17.
//  Copyright © 2017 UofT. All rights reserved.
//


public protocol Filter {
    func apply(image:RGBAImage) -> RGBAImage
}