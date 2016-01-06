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

class ConstEncodableDictionaryModel : Encodable {
    let rect: [String: EncodableRect]
    let rectOpt: [String: EncodableRect]?
    let rectOptNil: [String: EncodableRect]?

    init(rect: [String: EncodableRect], rectOpt: [String: EncodableRect]?,
        rectOptNil: [String: EncodableRect]?) {
        self.rect = rect
        self.rectOpt = rectOpt
        self.rectOptNil = rectOptNil
    }

    required init?(_ decoder: Decoder) {
        rect = decoder.encodableDictionary("rect") ?? [:]
        rectOpt = decoder.encodableDictionary("rectOpt")
        rectOptNil = decoder.encodableDictionary("rectOptNil")
    }

    func encode(encoder: Encoder) {
        encoder.addEncodableDictionary(rect, key: "rect")
        encoder.addEncodableDictionary(rectOpt, key: "rectOpt")
        encoder.addEncodableDictionary(rectOptNil, key: "rectOptNil")
    }
}