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



class ConstStringArrayModel: Encodable {
    let stringA: [String]
    let stringAOpt: [String]?
    let stringAOptNil: [String]?

    init() {
        stringA = ["Yes"]
        stringAOpt = nil
        stringAOptNil = ["There"]
    }

    init(stringA: [String], stringAOpt: [String]?, stringAOptNil: [String]?) {
        self.stringA = stringA
        self.stringAOpt = stringAOpt
        self.stringAOptNil = stringAOptNil
    }

    required init?(_ decoder: Decoder) {
        // Because all of our properties are constants and haven't been initialized yet
        // the <-- infix operator won't work here, so we'll use the methods on the
        // decoder to get our values
        
        stringA = decoder.stringArray("stringA") ?? []
        stringAOpt = decoder.stringArray("stringAOpt")
        stringAOptNil = decoder.stringArray("stringAOptNil")
    }

    func encode(encoder: Encoder) {
        encoder.addStringArray(stringA, key: "stringA")
        encoder.addStringArray(stringAOpt, key: "stringAOpt")
        encoder.addStringArray(stringAOptNil, key: "stringAOptNil")
    }
}
