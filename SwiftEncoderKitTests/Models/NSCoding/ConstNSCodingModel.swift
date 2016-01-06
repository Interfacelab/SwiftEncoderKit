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

class ConstNSCodingModel : Encodable {
    let image:UIImage
    let imageOpt: UIImage?
    let imageOptNil: UIImage?

    let color: UIColor
    let colorOpt: UIColor?
    let colorOptNil: UIColor?

    init() {
        let bundle = NSBundle(forClass: self.dynamicType)
        let path = bundle.pathForResource("test-image", ofType: "jpg")

        image = UIImage(contentsOfFile: path!)!
        imageOpt = nil
        imageOptNil = UIImage(contentsOfFile: path!)!

        color = UIColor.whiteColor()
        colorOpt = nil
        colorOptNil = UIColor.whiteColor()
    }

    init(image:UIImage, imageOpt: UIImage?, imageOptNil: UIImage?, color: UIColor,
        colorOpt: UIColor?, colorOptNil: UIColor?) {
            self.image = image
            self.imageOpt = imageOpt
            self.imageOptNil = imageOptNil

            self.color = color
            self.colorOpt = colorOpt
            self.colorOptNil = colorOptNil
    }

    required init?(_ decoder: Decoder) {
        let bundle = NSBundle(forClass: self.dynamicType)
        let path = bundle.pathForResource("test-image", ofType: "jpg")

        // Because all of our properties are constants and haven't been initialized yet
        // the <-- infix operator won't work here, so we'll use the methods on the
        // decoder to get our values

        image = decoder.nsCoding("image") ?? UIImage(contentsOfFile: path!)!
        imageOpt = decoder.nsCoding("imageOpt")
        imageOptNil = decoder.nsCoding("imageOptNil")

        color = decoder.nsCoding("color") ?? UIColor.whiteColor()
        colorOpt = decoder.nsCoding("colorOpt")
        colorOptNil = decoder.nsCoding("colorOptNil")
    }

    func encode(encoder: Encoder) {
        encoder.addNSCoding(image, key: "image")
        encoder.addNSCoding(imageOpt, key: "imageOpt")
        encoder.addNSCoding(imageOptNil, key: "imageOptNil")
        
        encoder.addNSCoding(color, key: "color")
        encoder.addNSCoding(colorOpt, key: "colorOpt")
        encoder.addNSCoding(colorOptNil, key: "colorOptNil")
    }
}
