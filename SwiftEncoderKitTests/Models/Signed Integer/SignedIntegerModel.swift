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


class SignedIntegerModel: Encodable {
    var int: Int = 1
    var int8: Int8 = 2
    var int16: Int16 = 3
    var int32: Int32 = 4
    var int64: Int64 = 5

    var intOpt: Int?
    var int8Opt: Int8?
    var int16Opt: Int16?
    var int32Opt: Int32?
    var int64Opt: Int64?

    var intOptNil: Int? = 1
    var int8OptNil: Int8? = 2
    var int16OptNil: Int16? = 3
    var int32OptNil: Int32? = 4
    var int64OptNil: Int64? = 5

    init() {

    }

    required init?(_ decoder: Decoder) {
        int     <-- decoder["int"]
        int8    <-- decoder["int8"]
        int16   <-- decoder["int16"]
        int32   <-- decoder["int32"]
        int64   <-- decoder["int64"]

        intOpt     <-- decoder["intOpt"]
        int8Opt    <-- decoder["int8Opt"]
        int16Opt   <-- decoder["int16Opt"]
        int32Opt   <-- decoder["int32Opt"]
        int64Opt   <-- decoder["int64Opt"]

        intOptNil     <-- decoder["intOptNil"]
        int8OptNil    <-- decoder["int8OptNil"]
        int16OptNil   <-- decoder["int16OptNil"]
        int32OptNil   <-- decoder["int32OptNil"]
        int64OptNil   <-- decoder["int64OptNil"]
    }

    func encode(encoder: Encoder) {
        int     --> encoder["int"]
        int8    --> encoder["int8"]
        int16   --> encoder["int16"]
        int32   --> encoder["int32"]
        int64   --> encoder["int64"]

        intOpt     --> encoder["intOpt"]
        int8Opt    --> encoder["int8Opt"]
        int16Opt   --> encoder["int16Opt"]
        int32Opt   --> encoder["int32Opt"]
        int64Opt   --> encoder["int64Opt"]

        intOptNil     --> encoder["intOptNil"]
        int8OptNil    --> encoder["int8OptNil"]
        int16OptNil   --> encoder["int16OptNil"]
        int32OptNil   --> encoder["int32OptNil"]
        int64OptNil   --> encoder["int64OptNil"]
    }
}
