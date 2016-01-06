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

class ConstEncodableModel: Encodable {
    let rect: EncodableRect
    let rectOpt: EncodableRect?
    let rectOptNil: EncodableRect?

    init(rect: EncodableRect, rectOpt: EncodableRect?, rectOptNil: EncodableRect?) {
        self.rect = rect
        self.rectOpt = rectOpt
        self.rectOptNil = rectOptNil
    }

    required init?(_ decoder: Decoder) {
        rect = decoder.encodable("rect") ?? EncodableRect()
        rectOpt = decoder.encodable("rectOpt")
        rectOptNil = decoder.encodable("rectOptNil")
    }

    func encode(encoder: Encoder) {
        encoder.addEncodable(rect, key: "rect")
        encoder.addEncodable(rectOpt, key: "rectOpt")
        encoder.addEncodable(rectOptNil, key: "rectOptNil")
    }
}