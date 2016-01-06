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

class NSCodingModel: Encodable {
    var image: UIImage
    var imageOpt: UIImage?
    var imageOptNil: UIImage?

    var color: UIColor
    var colorOpt: UIColor?
    var colorOptNil: UIColor?

    init() {
        let bundle = NSBundle(forClass: self.dynamicType)
        let path = bundle.pathForResource("test-image", ofType: "jpg")

        image = UIImage(contentsOfFile: path!)!
        color = UIColor.whiteColor()
    }

    required init?(_ decoder: Decoder) {
        let bundle = NSBundle(forClass: self.dynamicType)
        let path = bundle.pathForResource("test-image", ofType: "jpg")

        // This non-optional hasn't been initialized yet, so we can't use the
        // <-- infix operator
        image = decoder.nsCoding("image") ?? UIImage(contentsOfFile: path!)!

        imageOpt <-- decoder["imageOpt"]
        imageOptNil <-- decoder["imageOptNil"]

        // This non-optional hasn't been initialized yet, so we can't use the
        // <-- infix operator
        color = decoder.nsCoding("color") ?? UIColor.whiteColor()

        colorOpt <-- decoder["colorOpt"]
        colorOptNil <-- decoder["colorOptNil"]
    }

    func encode(encoder: Encoder) {
        image --> encoder["image"]
        imageOpt --> encoder["imageOpt"]
        imageOptNil --> encoder["imageOptNil"]

        color --> encoder["color"]
        colorOpt --> encoder["colorOpt"]
        colorOptNil --> encoder["colorOptNil"]
    }
}
