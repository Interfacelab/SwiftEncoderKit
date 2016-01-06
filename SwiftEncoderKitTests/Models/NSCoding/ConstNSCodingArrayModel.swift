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
        imageA = decoder.nsCodingArray("imageA") ?? []
        imageOptA = decoder.nsCodingArray("imageOptA")
        imageOptNilA = decoder.nsCodingArray("imageOptNilA")

        colorA = decoder.nsCodingArray("colorA") ?? []
        colorOptA = decoder.nsCodingArray("colorOptA")
        colorOptNilA = decoder.nsCodingArray("colorOptNilA")
    }

    func encode(encoder: Encoder) {
        imageA --> encoder["imageA"]
        imageOptA --> encoder["imageOptA"]
        imageOptNilA --> encoder["imageOptNilA"]

        colorA --> encoder["colorA"]
        colorOptA --> encoder["colorOptA"]
        colorOptNilA --> encoder["colorOptNilA"]
    }
}
