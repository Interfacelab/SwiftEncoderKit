//
//  CoreGraphicsEncoding.swift
//  SwiftEncoderKit
//
//  Created by Jon Gilkison on 1/5/16.
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


import CoreGraphics

extension CGPoint: Encodable {
    init?(_ decoder: Decoder) {
        x = decoder.cgFloat("x")!
        y = decoder.cgFloat("y")!
    }

    func encode(encoder: Encoder) {
        x --> encoder["x"]
        y --> encoder["y"]
    }
}

extension CGSize: Encodable {
    init?(_ decoder: Decoder) {
        width = decoder.cgFloat("width")!
        height = decoder.cgFloat("height")!
    }

    func encode(encoder: Encoder) {
        width --> encoder["width"]
        height --> encoder["height"]
    }
}

extension CGVector: Encodable {
    init?(_ decoder: Decoder) {
        dx = decoder.cgFloat("dx")!
        dy = decoder.cgFloat("dy")!
    }

    func encode(encoder: Encoder) {
        dx --> encoder["dx"]
        dy --> encoder["dy"]
    }
}

extension CGRect: Encodable {
    init?(_ decoder: Decoder) {
        origin = decoder.encodable("origin")!
        size = decoder.encodable("size")!
    }

    func encode(encoder: Encoder) {
        origin --> encoder["origin"]
        size --> encoder["size"]
    }
}

extension CGAffineTransform: Encodable {
    init?(_ decoder: Decoder) {
        a = decoder.cgFloat("a")!
        b = decoder.cgFloat("b")!
        c = decoder.cgFloat("c")!
        d = decoder.cgFloat("d")!
        tx = decoder.cgFloat("tx")!
        ty = decoder.cgFloat("tx")!
    }

    func encode(encoder: Encoder) {
        a --> encoder["a"]
        b --> encoder["b"]
        c --> encoder["c"]
        d  --> encoder["d"]
        tx --> encoder["tx"]
        ty --> encoder["ty"]
    }
}

