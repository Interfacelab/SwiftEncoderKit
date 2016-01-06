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


class UnsignedIntegerDictionaryModel: Encodable {
    var uint: [String: UInt] = [:]
    var uint8: [String: UInt8] = [:]
    var uint16: [String: UInt16] = [:]
    var uint32: [String: UInt32] = [:]
    var uint64: [String: UInt64] = [:]

    var uintOpt: [String: UInt]?
    var uint8Opt: [String: UInt8]?
    var uint16Opt: [String: UInt16]?
    var uint32Opt: [String: UInt32]?
    var uint64Opt: [String: UInt64]?

    var uintOptNil: [String: UInt]? = [:]
    var uint8OptNil: [String: UInt8]? = [:]
    var uint16OptNil: [String: UInt16]? = [:]
    var uint32OptNil: [String: UInt32]? = [:]
    var uint64OptNil: [String: UInt64]? = [:]

    init() {

    }

    required init?(_ decoder: Decoder) {
        uint     <-- decoder["uint"]
        uint8    <-- decoder["uint8"]
        uint16   <-- decoder["uint16"]
        uint32   <-- decoder["uint32"]
        uint64   <-- decoder["uint64"]

        uintOpt     <-- decoder["uintOpt"]
        uint8Opt    <-- decoder["uint8Opt"]
        uint16Opt   <-- decoder["uint16Opt"]
        uint32Opt   <-- decoder["uint32Opt"]
        uint64Opt   <-- decoder["uint64Opt"]

        uintOptNil     <-- decoder["uintOptNil"]
        uint8OptNil    <-- decoder["uint8OptNil"]
        uint16OptNil   <-- decoder["uint16OptNil"]
        uint32OptNil   <-- decoder["uint32OptNil"]
        uint64OptNil   <-- decoder["uint64OptNil"]
    }

    func encode(encoder: Encoder) {
        uint     --> encoder["uint"]
        uint8    --> encoder["uint8"]
        uint16   --> encoder["uint16"]
        uint32   --> encoder["uint32"]
        uint64   --> encoder["uint64"]

        uintOpt     --> encoder["uintOpt"]
        uint8Opt    --> encoder["uint8Opt"]
        uint16Opt   --> encoder["uint16Opt"]
        uint32Opt   --> encoder["uint32Opt"]
        uint64Opt   --> encoder["uint64Opt"]

        uintOptNil     --> encoder["uintOptNil"]
        uint8OptNil    --> encoder["uint8OptNil"]
        uint16OptNil   --> encoder["uint16OptNil"]
        uint32OptNil   --> encoder["uint32OptNil"]
        uint64OptNil   --> encoder["uint64OptNil"]
    }
}
