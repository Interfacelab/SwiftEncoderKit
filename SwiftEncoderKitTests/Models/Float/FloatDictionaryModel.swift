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



class FloatDictionaryModel: Encodable {
    var floatD: [String: Float] = ["a": 1.0, "b": 2.0, "c": 3.0]
    var floatDOpt: [String: Float]?
    var floatDOptNil: [String: Float]? = ["a": 1.0, "b": 2.0, "c": 3.0]

    var doubleD: [String: Double] = ["a": 1.0, "b": 2.0, "c": 3.0]
    var doubleDOpt: [String: Double]?
    var doubleDOptNil: [String: Double]? = ["a": 1.0, "b": 2.0, "c": 3.0]

    init() {

    }

    required init?(_ decoder: Decoder) {
        floatD          <-- decoder["floatD"]
        floatDOpt       <-- decoder["floatDOpt"]
        floatDOptNil    <-- decoder["floatDOptNil"]

        doubleD         <-- decoder["doubleD"]
        doubleDOpt      <-- decoder["doubleDOpt"]
        doubleDOptNil   <-- decoder["doubleDOptNil"]
    }

    func encode(encoder: Encoder) {
        floatD          --> encoder["floatD"]
        floatDOpt       --> encoder["floatDOpt"]
        floatDOptNil    --> encoder["floatDOptNil"]

        doubleD         --> encoder["doubleD"]
        doubleDOpt      --> encoder["doubleDOpt"]
        doubleDOptNil   --> encoder["doubleDOptNil"]
    }
}
