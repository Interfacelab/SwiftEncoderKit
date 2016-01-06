//
//  StringTests.swift
//  SwiftEncoderKit
//
//  Created by Jon Gilkison on 1/3/16.
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


import XCTest

class NSCodingReferenceTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testNSCodingReference() {
        let fileName = "/tmp/nscoding-ref.plist"

        let model = NSCodingReference()

        model.int = Int.max
        model.int32 = Int32.max
        model.int64 = Int64.max

        // Note that you can't encode Float.infinity only FLT_MAX
        model.float = FLT_MAX
        model.double = Double.infinity

        model.string = "A String"
        model.bool = true

        model.intA = [Int.max]

        model.uintA = [UInt.max]

        model.floatA = [FLT_MAX]
        model.doubleA = [Double.infinity]

        model.stringA = ["Another String"]
        model.boolA = [true, false, true]

        model.intD = ["entry": Int.max]

        model.uintD = ["entry": UInt.max]

        model.floatD =  ["entry": FLT_MAX]
        model.doubleD = ["entry": Double.infinity]

        model.stringD = ["A String": "Another String"]
        model.boolD = ["entry": true]

        model.intEnum = IntEnum.value3
        model.stringEnum = StringEnum.value3

        let data = NSKeyedArchiver.archivedDataWithRootObject(model)
        data.writeToFile(fileName, atomically: true)

        let reModel = NSKeyedUnarchiver.unarchiveObjectWithFile(fileName) as? NSCodingReference

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.int == Int.max)
            XCTAssert(reModel!.int32 == Int32.max)
            XCTAssert(reModel!.int64 == Int64.max)
            XCTAssert(reModel!.float == FLT_MAX)
            XCTAssert(reModel!.double == Double.infinity)
            XCTAssert(reModel!.string == "A String")
            XCTAssert(reModel!.bool == true)
            XCTAssert(reModel!.intA == [Int.max])
            XCTAssert(reModel!.uintA == [UInt.max])
            XCTAssert(reModel!.floatA == [FLT_MAX])
            XCTAssert(reModel!.doubleA == [Double.infinity])
            XCTAssert(reModel!.stringA == ["Another String"])
            XCTAssert(reModel!.boolA == [true, false, true])
            XCTAssert(reModel!.intD == ["entry": Int.max])
            XCTAssert(reModel!.uintD == ["entry": UInt.max])
            XCTAssert(reModel!.floatD ==  ["entry": FLT_MAX])
            XCTAssert(reModel!.doubleD == ["entry": Double.infinity])
            XCTAssert(reModel!.stringD == ["A String": "Another String"])
            XCTAssert(reModel!.boolD == ["entry": true])
            XCTAssert(reModel!.intEnum == IntEnum.value3)
            XCTAssert(reModel!.stringEnum == StringEnum.value3)
        }
    }    
}
