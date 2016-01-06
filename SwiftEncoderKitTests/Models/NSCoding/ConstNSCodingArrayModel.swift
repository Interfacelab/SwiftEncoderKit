//
//  NSCodingModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/3/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

import UIKit

class ConstNSCodingArrayModel : Encodable {
    let imageA: [UIImage]
    let imageOptA: [UIImage]?
    let imageOptNilA: [UIImage]?

    let colorA: [UIColor]
    let colorOptA: [UIColor]?
    let colorOptNilA: [UIColor]?

    init() {
        imageA = []
        imageOptA = nil
        imageOptNilA = []

        colorA = []
        colorOptA = nil
        colorOptNilA = []
    }

    init(imageA: [UIImage], imageOptA: [UIImage]?, imageOptNilA: [UIImage]?, colorA: [UIColor],
        colorOptA: [UIColor]?, colorOptNilA: [UIColor]?) {
            self.imageA = imageA
            self.imageOptA = imageOptA
            self.imageOptNilA = imageOptNilA

            self.colorA = colorA
            self.colorOptA = colorOptA
            self.colorOptNilA = colorOptNilA
    }

    required init?(_ decoder: Decoder) {
        // Because all of our properties are constants and haven't been initialized yet
        // the <-- infix operator won't work here, so we'll use the methods on the
        // decoder to get our values

        imageA = decoder.nsCodingArray("imageA") ?? []
        imageOptA = decoder.nsCodingArray("imageOptA")
        imageOptNilA = decoder.nsCodingArray("imageOptNilA")

        colorA = decoder.nsCodingArray("colorA") ?? []
        colorOptA = decoder.nsCodingArray("colorOptA")
        colorOptNilA = decoder.nsCodingArray("colorOptNilA")
    }

    func encode(encoder: Encoder) {
        encoder.addNSCodingArray(imageA, key: "imageA")
        encoder.addNSCodingArray(imageOptA, key: "imageOptA")
        encoder.addNSCodingArray(imageOptNilA, key: "imageOptNilA")

        encoder.addNSCodingArray(colorA, key: "colorA")
        encoder.addNSCodingArray(colorOptA, key: "colorOptA")
        encoder.addNSCodingArray(colorOptNilA, key: "colorOptNilA")
    }
}
