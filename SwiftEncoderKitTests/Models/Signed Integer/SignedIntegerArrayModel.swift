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


class SignedIntegerArrayModel: Encodable {
    var intA: [Int] = []
    var int8A: [Int8] = []
    var int16A: [Int16] = []
    var int32A: [Int32] = []
    var int64A: [Int64] = []

    var intAOpt: [Int]?
    var int8AOpt: [Int8]?
    var int16AOpt: [Int16]?
    var int32AOpt: [Int32]?
    var int64AOpt: [Int64]?

    var intAOptNil: [Int]? = [1, 2, 3, 4]
    var int8AOptNil: [Int8]? = [1, 2, 3, 4]
    var int16AOptNil: [Int16]? = [1, 2, 3, 4]
    var int32AOptNil: [Int32]? = [1, 2, 3, 4]
    var int64AOptNil: [Int64]? = [1, 2, 3, 4]

    init() {

    }

    required init?(_ decoder: Decoder) {
        intA     <-- decoder["intA"]
        int8A    <-- decoder["int8A"]
        int16A   <-- decoder["int16A"]
        int32A   <-- decoder["int32A"]
        int64A   <-- decoder["int64A"]

        intAOpt     <-- decoder["intAOpt"]
        int8AOpt    <-- decoder["int8AOpt"]
        int16AOpt   <-- decoder["int16AOpt"]
        int32AOpt   <-- decoder["int32AOpt"]
        int64AOpt   <-- decoder["int64AOpt"]

        intAOptNil     <-- decoder["intAOptNil"]
        int8AOptNil    <-- decoder["int8AOptNil"]
        int16AOptNil   <-- decoder["int16AOptNil"]
        int32AOptNil   <-- decoder["int32AOptNil"]
        int64AOptNil   <-- decoder["int64AOptNil"]
    }

    func encode(encoder: Encoder) {
        intA     --> encoder["intA"]
        int8A    --> encoder["int8A"]
        int16A   --> encoder["int16A"]
        int32A   --> encoder["int32A"]
        int64A   --> encoder["int64A"]

        intAOpt     --> encoder["intAOpt"]
        int8AOpt    --> encoder["int8AOpt"]
        int16AOpt   --> encoder["int16AOpt"]
        int32AOpt   --> encoder["int32AOpt"]
        int64AOpt   --> encoder["int64AOpt"]

        intAOptNil     --> encoder["intAOptNil"]
        int8AOptNil    --> encoder["int8AOptNil"]
        int16AOptNil   --> encoder["int16AOptNil"]
        int32AOptNil   --> encoder["int32AOptNil"]
        int64AOptNil   --> encoder["int64AOptNil"]
    }
}
