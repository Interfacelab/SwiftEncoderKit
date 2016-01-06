//
//  CMTimeEncoding.swift
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


import CoreMedia

extension CMTime: Encodable {
    init?(_ decoder: Decoder) {
        value = decoder.integer("value")!
        timescale = decoder.integer("timescale")!
        flags = decoder.enumValue("flags")!
        epoch = decoder.integer("epoch")!
    }

    func encode(encoder: Encoder) {
        value --> encoder["value"]
        timescale --> encoder["timescale"]
        flags  --> encoder["flags"]
        epoch --> encoder["epoch"]
    }
}

extension CMTimeRange: Encodable {
    init?(_ decoder: Decoder) {
        start = decoder.encodable("start")!
        duration = decoder.encodable("duration")!
    }

    func encode(encoder: Encoder) {
        start --> encoder["start"]
        duration --> encoder["duration"]
    }
}

extension CMTimeMapping: Encodable {
    init?(_ decoder: Decoder) {
        source = decoder.encodable("source")!
        target = decoder.encodable("target")!
    }

    func encode(encoder: Encoder) {
        source --> encoder["source"]
        target --> encoder["target"]
    }
}