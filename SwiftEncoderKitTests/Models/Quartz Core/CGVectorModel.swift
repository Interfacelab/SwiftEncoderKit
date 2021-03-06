//
//  CGVectorModel.swift
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

class CGVectorModel: Encodable {
    var vector: CGVector = CGVector.zero
    var vectorOpt: CGVector?
    var vectorOptNil: CGVector? = CGVector.zero

    var vectorA: [CGVector] = []
    var vectorOptA: [CGVector]?
    var vectorOptNilA: [CGVector]? = []

    var vectorD: [String: CGVector] = [:]
    var vectorOptD: [String: CGVector]?
    var vectorOptNilD: [String: CGVector]? = [:]

    init() {

    }

    required init?(_ decoder: Decoder) {
        vector <-- decoder["vector"]
        vectorOpt <-- decoder["vectorOpt"]
        vectorOptNil <-- decoder["vectorOptNil"]
        vectorA <-- decoder["vectorA"]
        vectorOptA <-- decoder["vectorOptA"]
        vectorOptNilA <-- decoder["vectorOptNilA"]
        vectorD <-- decoder["vectorD"]
        vectorOptD <-- decoder["vectorOptD"]
        vectorOptNilD <-- decoder["vectorOptNilD"]
    }

    func encode(encoder: Encoder) {
        vector --> encoder["vector"]
        vectorOpt --> encoder["vectorOpt"]
        vectorOptNil --> encoder["vectorOptNil"]
        vectorA --> encoder["vectorA"]
        vectorOptA --> encoder["vectorOptA"]
        vectorOptNilA --> encoder["vectorOptNilA"]
        vectorD --> encoder["vectorD"]
        vectorOptD --> encoder["vectorOptD"]
        vectorOptNilD --> encoder["vectorOptNilD"]
    }
    
}