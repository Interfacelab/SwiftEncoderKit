//
//  NSCodingModel.swift
//  SwiftEncoderKit
//
//  Created by Jon Gilkison on 1/3/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.


import Foundation

import UIKit

class ConstNSCodingArrayModel: Encodable {
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
