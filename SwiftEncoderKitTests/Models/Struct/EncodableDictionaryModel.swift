//
//  EncodableView.swift
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

class EncodableDictionaryModel: Encodable {
    var rect: [String: EncodableRect] = [:]
    var rectOpt: [String: EncodableRect]?
    var rectOptNil: [String: EncodableRect]?

    init() {

    }

    required init?(_ decoder: Decoder) {
        rect <-- decoder["rect"]
        rectOpt <-- decoder["rectOpt"]
        rectOptNil <-- decoder["rectOptNil"]
    }

    func encode(encoder: Encoder) {
        rect --> encoder["rect"]
        rectOpt --> encoder["rectOpt"]
        rectOptNil --> encoder["rectOptNil"]
    }
}