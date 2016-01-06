//
//  EncodableRect.swift
//  SwiftEncoderKit
//
//  Created by Jon Gilkison on 1/4/16.
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

struct EncodableRect {
    let origin: EncodablePoint
    let size: EncodableSize

    init() {
        origin = EncodablePoint()
        size = EncodableSize()
    }

    init(x: Float, y: Float, width: Float, height: Float) {
        origin = EncodablePoint(x: x, y: y)
        size = EncodableSize(width: width, height: height)
    }

    init(origin: EncodablePoint, size: EncodableSize) {
        self.origin = origin
        self.size = size
    }
}

extension EncodableRect : Encodable {
    init?(_ decoder: Decoder) {
        origin = decoder.encodable("origin") ?? EncodablePoint(x: 0, y: 0)
        size = decoder.encodable("size") ?? EncodableSize(width: 0, height: 0)
    }

    func encode(encoder: Encoder) {
        encoder.addEncodable(origin, key: "origin")
        encoder.addEncodable(size, key: "size")
    }
}