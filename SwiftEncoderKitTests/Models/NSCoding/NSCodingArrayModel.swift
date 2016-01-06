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

class NSCodingArrayModel: Encodable {
    var imageA: [OSImage]
    var imageOptA: [OSImage]?
    var imageOptNilA: [OSImage]?

    var colorA: [OSColor]
    var colorOptA: [OSColor]?
    var colorOptNilA: [OSColor]?

    init() {
        imageA = []
        colorA = []
    }

    required init?(_ decoder: Decoder) {
        // This non-optional hasn't been initialized yet, so we can't use the
        // <-- infix operator
        imageA = decoder.nsCodingArray("imageA") ?? []

        imageOptA <-- decoder["imageOptA"]
        imageOptNilA <-- decoder["imageOptNilA"]

        // This non-optional hasn't been initialized yet, so we can't use the
        // <-- infix operator
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
