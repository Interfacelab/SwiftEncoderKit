//
//  CGRectModel.swift
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

class ConstCGRectModel: Encodable {
    let rect: CGRect
    let rectOpt: CGRect?
    let rectOptNil: CGRect?

    let rectA: [CGRect]
    let rectOptA: [CGRect]?
    let rectOptNilA: [CGRect]?

    let rectD: [String: CGRect]
    let rectOptD: [String: CGRect]?
    let rectOptNilD: [String: CGRect]?

    init(rect: CGRect,
        rectOpt: CGRect?,
        rectOptNil: CGRect?,
        rectA: [CGRect],
        rectOptA: [CGRect]?,
        rectOptNilA: [CGRect]?,
        rectD: [String: CGRect],
        rectOptD: [String: CGRect]?,
        rectOptNilD: [String: CGRect]?) {
            self.rect = rect
            self.rectOpt = rectOpt
            self.rectOptNil = rectOptNil
            self.rectA = rectA
            self.rectOptA = rectOptA
            self.rectOptNilA = rectOptNilA
            self.rectD = rectD
            self.rectOptD = rectOptD
            self.rectOptNilD = rectOptNilD
    }

    required init?(_ decoder: Decoder) {
        rect = decoder.encodable("rect")!
        rectOpt = decoder.encodable("rectOpt")
        rectOptNil = decoder.encodable("rectOptNil")

        rectA = decoder.encodableArray("rectA")!
        rectOptA = decoder.encodableArray("rectOptA")
        rectOptNilA = decoder.encodableArray("rectOptNilA")

        rectD = decoder.encodableDictionary("rectD")!
        rectOptD = decoder.encodableDictionary("rectOptD")
        rectOptNilD = decoder.encodableDictionary("rectOptNilD")
    }

    func encode(encoder: Encoder) {
        encoder.addEncodable(rect, key: "rect")
        encoder.addEncodable(rectOpt, key: "rectOpt")
        encoder.addEncodable(rectOptNil, key: "rectOptNil")

        encoder.addEncodableArray(rectA, key: "rectA")
        encoder.addEncodableArray(rectOptA, key: "rectOptA")
        encoder.addEncodableArray(rectOptNilA, key: "rectOptNilA")
        
        encoder.addEncodableDictionary(rectD, key: "rectD")
        encoder.addEncodableDictionary(rectOptD, key: "rectOptD")
        encoder.addEncodableDictionary(rectOptNilD, key: "rectOptNilD")
    }
    
}