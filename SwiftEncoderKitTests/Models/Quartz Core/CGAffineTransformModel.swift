//
//  CGAffineTransformModel.swift
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


import QuartzCore

class CGAffineTransformModel: Encodable {
    var transform: CGAffineTransform = CGAffineTransformIdentity
    var transformOpt: CGAffineTransform?
    var transformOptNil: CGAffineTransform? = CGAffineTransformIdentity

    var transformA: [CGAffineTransform] = []
    var transformOptA: [CGAffineTransform]?
    var transformOptNilA: [CGAffineTransform]? = []

    var transformD: [String: CGAffineTransform] = [:]
    var transformOptD: [String: CGAffineTransform]?
    var transformOptNilD: [String: CGAffineTransform]? = [:]

    init() {

    }

    required init?(_ decoder: Decoder) {
        transform <-- decoder["transform"]
        transformOpt <-- decoder["transformOpt"]
        transformOptNil <-- decoder["transformOptNil"]
        transformA <-- decoder["transformA"]
        transformOptA <-- decoder["transformOptA"]
        transformOptNilA <-- decoder["transformOptNilA"]
        transformD <-- decoder["transformD"]
        transformOptD <-- decoder["transformOptD"]
        transformOptNilD <-- decoder["transformOptNilD"]
    }

    func encode(encoder: Encoder) {
        transform --> encoder["transform"]
        transformOpt --> encoder["transformOpt"]
        transformOptNil --> encoder["transformOptNil"]
        transformA --> encoder["transformA"]
        transformOptA --> encoder["transformOptA"]
        transformOptNilA --> encoder["transformOptNilA"]
        transformD --> encoder["transformD"]
        transformOptD --> encoder["transformOptD"]
        transformOptNilD --> encoder["transformOptNilD"]
    }
    
}