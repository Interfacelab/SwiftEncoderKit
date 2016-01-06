//
//  CATransform3DModel.swift
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

class CATransform3DModel: Encodable {
    var t3d: CATransform3D = CATransform3DIdentity
    var t3dOpt: CATransform3D? = CATransform3DIdentity
    var t3dOptNil: CATransform3D?

    var t3dA: [CATransform3D] = []
    var t3dOptA: [CATransform3D]? = []
    var t3dOptNilA: [CATransform3D]?

    var t3dD: [String: CATransform3D] = [:]
    var t3dOptD: [String: CATransform3D]? = [:]
    var t3dOptNilD: [String: CATransform3D]?

    init() {

    }

    required init?(_ decoder: Decoder) {
        t3d <-- decoder["t3d"]
        t3dOpt <-- decoder["t3dOpt"]
        t3dOptNil <-- decoder["t3dOptNil"]
        t3dA <-- decoder["t3dA"]
        t3dOptA <-- decoder["t3dOptA"]
        t3dOptNilA <-- decoder["t3dOptNilA"]
        t3dD <-- decoder["t3dD"]
        t3dOptD <-- decoder["t3dOptD"]
        t3dOptNilD <-- decoder["t3dOptNilD"]
    }

    func encode(encoder: Encoder) {
        t3d --> encoder["t3d"]
        t3dOpt --> encoder["t3dOpt"]
        t3dOptNil --> encoder["t3dOptNil"]
        t3dA --> encoder["t3dA"]
        t3dOptA --> encoder["t3dOptA"]
        t3dOptNilA --> encoder["t3dOptNilA"]
        t3dD --> encoder["t3dD"]
        t3dOptD --> encoder["t3dOptD"]
        t3dOptNilD --> encoder["t3dOptNilD"]
    }
}