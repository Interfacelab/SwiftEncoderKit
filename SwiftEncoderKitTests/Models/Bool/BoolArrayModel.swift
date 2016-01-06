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



class BoolArrayModel: Encodable {
    var boolA: [Bool] = [false, true, false]
    var boolAOpt: [Bool]?
    var boolAOptNil: [Bool]? = [true, false, true]

    init() {

    }

    required init?(_ decoder: Decoder) {
        boolA           <-- decoder["boolA"]
        boolAOpt        <-- decoder["boolAOpt"]
        boolAOptNil     <-- decoder["boolAOptNil"]
    }

    func encode(encoder: Encoder) {
        boolA           --> encoder["boolA"]
        boolAOpt        --> encoder["boolAOpt"]
        boolAOptNil     --> encoder["boolAOptNil"]
    }
}
