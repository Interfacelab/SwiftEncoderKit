//
//  CGVectorModel.swift
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

class ConstCGVectorModel: Encodable {
    let vector: CGVector
    let vectorOpt: CGVector?
    let vectorOptNil: CGVector?

    let vectorA: [CGVector]
    let vectorOptA: [CGVector]?
    let vectorOptNilA: [CGVector]?

    let vectorD: [String: CGVector]
    let vectorOptD: [String: CGVector]?
    let vectorOptNilD: [String: CGVector]?

    init(vector: CGVector,
        vectorOpt: CGVector?,
        vectorOptNil: CGVector?,
        vectorA: [CGVector],
        vectorOptA: [CGVector]?,
        vectorOptNilA: [CGVector]?,
        vectorD: [String: CGVector],
        vectorOptD: [String: CGVector]?,
        vectorOptNilD: [String: CGVector]?) {
            self.vector = vector
            self.vectorOpt = vectorOpt
            self.vectorOptNil = vectorOptNil
            self.vectorA = vectorA
            self.vectorOptA = vectorOptA
            self.vectorOptNilA = vectorOptNilA
            self.vectorD = vectorD
            self.vectorOptD = vectorOptD
            self.vectorOptNilD = vectorOptNilD
    }

    required init?(_ decoder: Decoder) {
        vector = decoder.encodable("vector")!
        vectorOpt = decoder.encodable("vectorOpt")
        vectorOptNil = decoder.encodable("vectorOptNil")

        vectorA = decoder.encodableArray("vectorA")!
        vectorOptA = decoder.encodableArray("vectorOptA")
        vectorOptNilA = decoder.encodableArray("vectorOptNilA")

        vectorD = decoder.encodableDictionary("vectorD")!
        vectorOptD = decoder.encodableDictionary("vectorOptD")
        vectorOptNilD = decoder.encodableDictionary("vectorOptNilD")
    }

    func encode(encoder: Encoder) {
        encoder.addEncodable(vector, key: "vector")
        encoder.addEncodable(vectorOpt, key: "vectorOpt")
        encoder.addEncodable(vectorOptNil, key: "vectorOptNil")

        encoder.addEncodableArray(vectorA, key: "vectorA")
        encoder.addEncodableArray(vectorOptA, key: "vectorOptA")
        encoder.addEncodableArray(vectorOptNilA, key: "vectorOptNilA")
        
        encoder.addEncodableDictionary(vectorD, key: "vectorD")
        encoder.addEncodableDictionary(vectorOptD, key: "vectorOptD")
        encoder.addEncodableDictionary(vectorOptNilD, key: "vectorOptNilD")
    }
    
}