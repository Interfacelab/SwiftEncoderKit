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

class NSCodingDictionaryModel: Encodable {
    var imageD: [String: UIImage]
    var imageOptD: [String: UIImage]?
    var imageOptNilD: [String: UIImage]?

    var colorD: [String: UIColor]
    var colorOptD: [String: UIColor]?
    var colorOptNilD: [String: UIColor]?

    init() {
        imageD = [:]
        colorD = [:]
    }

    required init?(_ decoder: Decoder) {
        // This non-optional hasn't been initialized yet, so we can't use the
        // <-- infix operator
        imageD = decoder.nsCodingDictionary("imageD") ?? [:]

        imageOptD <-- decoder["imageOptD"]
        imageOptNilD <-- decoder["imageOptNilD"]

        // This non-optional hasn't been initialized yet, so we can't use the
        // <-- infix operator
        colorD = decoder.nsCodingDictionary("colorD") ?? [:]

        colorOptD <-- decoder["colorOptD"]
        colorOptNilD <-- decoder["colorOptNilD"]
    }

    func encode(encoder: Encoder) {
        imageD --> encoder["imageD"]
        imageOptD --> encoder["imageOptD"]
        imageOptNilD --> encoder["imageOptNilD"]

        colorD --> encoder["colorD"]
        colorOptD --> encoder["colorOptD"]
        colorOptNilD --> encoder["colorOptNilD"]
    }
}
