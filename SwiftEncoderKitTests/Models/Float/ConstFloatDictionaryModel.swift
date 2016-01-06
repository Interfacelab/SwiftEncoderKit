//
//  TestModel.swift
//  SwiftEncoderKit
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
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



class ConstFloatDictionaryModel: Encodable {
    let floatD: [String: Float]
    let floatDOpt: [String: Float]?
    let floatDOptNil: [String: Float]?

    let doubleD: [String: Double]
    let doubleDOpt: [String: Double]?
    let doubleDOptNil: [String: Double]?

    init(floatD: [String: Float], floatDOpt: [String: Float]?, floatDOptNil: [String: Float]?,
        doubleD: [String: Double], doubleDOpt: [String: Double]?,
        doubleDOptNil: [String: Double]?) {
            self.floatD = floatD
            self.floatDOpt = floatDOpt
            self.floatDOptNil = floatDOptNil

            self.doubleD = doubleD
            self.doubleDOpt = doubleDOpt
            self.doubleDOptNil = doubleDOptNil
    }

    required init?(_ decoder: Decoder) {
        floatD = decoder.floatDictionary("floatD") ?? [:]
        floatDOpt = decoder.floatDictionary("floatDOpt")
        floatDOptNil = decoder.floatDictionary("floatDOptNil")

        doubleD = decoder.doubleDictionary("doubleD") ?? [:]
        doubleDOpt = decoder.doubleDictionary("doubleDOpt")
        doubleDOptNil = decoder.doubleDictionary("doubleDOptNil")
    }

    func encode(encoder: Encoder) {
        encoder.addFloatDictionary(floatD, key: "floatD")
        encoder.addFloatDictionary(floatDOpt, key: "floatDOpt")
        encoder.addFloatDictionary(floatDOptNil, key: "floatDOptNil")

        encoder.addDoubleDictionary(doubleD, key: "doubleD")
        encoder.addDoubleDictionary(doubleDOpt, key: "doubleDOpt")
        encoder.addDoubleDictionary(doubleDOptNil, key: "doubleDOptNil")
    }
}
