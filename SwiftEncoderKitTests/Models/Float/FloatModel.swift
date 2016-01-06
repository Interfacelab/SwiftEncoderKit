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



class FloatModel: Encodable {
    var float: Float = 1
    var floatOpt: Float?
    var floatOptNil: Float? = 2

    var double: Double = 1
    var doubleOpt: Double?
    var doubleOptNil: Double? = 2

    init() {

    }

    required init?(_ decoder: Decoder) {
        float           <-- decoder["float"]
        floatOpt        <-- decoder["floatOpt"]
        floatOptNil     <-- decoder["floatOptNil"]

        double          <-- decoder["double"]
        doubleOpt       <-- decoder["doubleOpt"]
        doubleOptNil    <-- decoder["doubleOptNil"]
    }

    func encode(encoder: Encoder) {
        float           --> encoder["float"]
        floatOpt        --> encoder["floatOpt"]
        floatOptNil     --> encoder["floatOptNil"]

        double          --> encoder["double"]
        doubleOpt       --> encoder["doubleOpt"]
        doubleOptNil    --> encoder["doubleOptNil"]
    }
}
