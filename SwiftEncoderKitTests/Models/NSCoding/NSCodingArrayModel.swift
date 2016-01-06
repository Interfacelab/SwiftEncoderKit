//
//  NSCodingModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/3/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

import UIKit

class NSCodingArrayModel : Encodable {
    var imageA: [UIImage]
    var imageOptA: [UIImage]?
    var imageOptNilA: [UIImage]?

    var colorA: [UIColor]
    var colorOptA: [UIColor]?
    var colorOptNilA: [UIColor]?

    init() {
        imageA = []
        colorA = []
    }

    required init?(_ decoder: Decoder) {
        imageA = decoder.nsCodingArray("imageA") ?? []
        imageOptA <-- decoder["imageOptA"]
        imageOptNilA <-- decoder["imageOptNilA"]

        colorA = decoder.nsCodingArray("colorA") ?? []
        colorOptA <-- decoder["colorOptA"]
        colorOptNilA <-- decoder["colorOptNilA"]
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
