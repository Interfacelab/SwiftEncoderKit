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

class ConstNSCodingDictionaryModel: Encodable {
    let imageD: [String: OSImage]
    let imageOptD: [String: OSImage]?
    let imageOptNilD: [String: OSImage]?

    let colorD: [String: OSColor]
    let colorOptD: [String: OSColor]?
    let colorOptNilD: [String: OSColor]?

    init(imageD: [String: OSImage], imageOptD: [String: OSImage]?, imageOptNilD: [String: OSImage]?,
        colorD: [String: OSColor], colorOptD: [String: OSColor]?,
        colorOptNilD: [String: OSColor]?) {

            self.imageD = imageD
            self.imageOptD = imageOptD
            self.imageOptNilD = imageOptNilD

            self.colorD = colorD
            self.colorOptD = colorOptD
            self.colorOptNilD = colorOptNilD
    }

    required init?(_ decoder: Decoder) {
        // Because all of our properties are constants and haven't been initialized yet
        // the <-- infix operator won't work here, so we'll use the methods on the
        // decoder to get our values

        imageD = decoder.nsCodingDictionary("imageD") ?? [:]
        imageOptD = decoder.nsCodingDictionary("imageOptD")
        imageOptNilD = decoder.nsCodingDictionary("imageOptNilD")

        colorD = decoder.nsCodingDictionary("colorD") ?? [:]
        colorOptD = decoder.nsCodingDictionary("colorOptD")
        colorOptNilD = decoder.nsCodingDictionary("colorOptNilD")
    }

    func encode(encoder: Encoder) {
        encoder.addNSCodingDictionary(imageD, key: "imageD")
        encoder.addNSCodingDictionary(imageOptD, key: "imageOptD")
        encoder.addNSCodingDictionary(imageOptNilD, key: "imageOptNilD")
        
        encoder.addNSCodingDictionary(colorD, key: "colorD")
        encoder.addNSCodingDictionary(colorOptD, key: "colorOptD")
        encoder.addNSCodingDictionary(colorOptNilD, key: "colorOptNilD")
    }
}
