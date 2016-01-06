//
//  EncodableTests.swift
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


import XCTest

class EncodableTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testEncodableEncodingDecoding() {
        let fileName = "/tmp/encodable.plist"

        let model = EncodableModel()

        model.rect = EncodableRect(x: 100, y: 200, width: 400, height: 800)
        model.rectOpt = EncodableRect(x: 300, y: 600, width: 900, height: 1200)
        model.rectOptNil = nil

        Encoder(model).writeToFile(fileName)
        let reModel:EncodableModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.rect.origin.x == 100)
            XCTAssert(reModel!.rect.origin.y == 200)
            XCTAssert(reModel!.rect.size.width == 400)
            XCTAssert(reModel!.rect.size.height == 800)

            XCTAssert(reModel!.rectOpt!.origin.x == 300)
            XCTAssert(reModel!.rectOpt!.origin.y == 600)
            XCTAssert(reModel!.rectOpt!.size.width == 900)
            XCTAssert(reModel!.rectOpt!.size.height == 1200)

            XCTAssert(reModel!.rectOptNil == nil)
        }
    }

    func testConstEncodableEncodingDecoding() {
        let fileName = "/tmp/constEncodable.plist"

        let rect = EncodableRect(x: 100, y: 200, width: 400, height: 800)
        let rectOpt = EncodableRect(x: 300, y: 600, width: 900, height: 1200)

        let model = ConstEncodableModel(rect: rect, rectOpt: rectOpt, rectOptNil: nil)

        Encoder(model).writeToFile(fileName)
        let reModel:ConstEncodableModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.rect.origin.x == 100)
            XCTAssert(reModel!.rect.origin.y == 200)
            XCTAssert(reModel!.rect.size.width == 400)
            XCTAssert(reModel!.rect.size.height == 800)

            XCTAssert(reModel!.rectOpt!.origin.x == 300)
            XCTAssert(reModel!.rectOpt!.origin.y == 600)
            XCTAssert(reModel!.rectOpt!.size.width == 900)
            XCTAssert(reModel!.rectOpt!.size.height == 1200)

            XCTAssert(reModel!.rectOptNil == nil)
        }
    }

    func testEncodableArrayEncodingDecoding() {
        let fileName = "/tmp/encodableArray.plist"

        let model = EncodableArrayModel()

        model.rect = [EncodableRect(x: 100, y: 200, width: 400, height: 800),
            EncodableRect(x: 10, y: 20, width: 40, height: 80)]
        model.rectOpt = [EncodableRect(x: 300, y: 600, width: 900, height: 1200),
            EncodableRect(x: 30, y: 60, width: 90, height: 120)]
        model.rectOptNil = nil

        Encoder(model).writeToFile(fileName)
        let reModel:EncodableArrayModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.rect.count == 2)
            XCTAssert(reModel!.rect[0].origin.x == 100)
            XCTAssert(reModel!.rect[0].origin.y == 200)
            XCTAssert(reModel!.rect[0].size.width == 400)
            XCTAssert(reModel!.rect[0].size.height == 800)
            XCTAssert(reModel!.rect[1].origin.x == 10)
            XCTAssert(reModel!.rect[1].origin.y == 20)
            XCTAssert(reModel!.rect[1].size.width == 40)
            XCTAssert(reModel!.rect[1].size.height == 80)

            XCTAssert(reModel!.rectOpt!.count == 2)
            XCTAssert(reModel!.rectOpt![0].origin.x == 300)
            XCTAssert(reModel!.rectOpt![0].origin.y == 600)
            XCTAssert(reModel!.rectOpt![0].size.width == 900)
            XCTAssert(reModel!.rectOpt![0].size.height == 1200)
            XCTAssert(reModel!.rectOpt![1].origin.x == 30)
            XCTAssert(reModel!.rectOpt![1].origin.y == 60)
            XCTAssert(reModel!.rectOpt![1].size.width == 90)
            XCTAssert(reModel!.rectOpt![1].size.height == 120)

            XCTAssert(reModel!.rectOptNil == nil)
        }
    }

    func testConstEncodableArrayEncodingDecoding() {
        let fileName = "/tmp/constEncodableArray.plist"

        let rect = [EncodableRect(x: 100, y: 200, width: 400, height: 800),
            EncodableRect(x: 10, y: 20, width: 40, height: 80)]
        let rectOpt = [EncodableRect(x: 300, y: 600, width: 900, height: 1200),
            EncodableRect(x: 30, y: 60, width: 90, height: 120)]

        let model = ConstEncodableArrayModel(rect: rect, rectOpt: rectOpt, rectOptNil: nil)

        Encoder(model).writeToFile(fileName)
        let reModel:ConstEncodableArrayModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.rect.count == 2)
            XCTAssert(reModel!.rect[0].origin.x == 100)
            XCTAssert(reModel!.rect[0].origin.y == 200)
            XCTAssert(reModel!.rect[0].size.width == 400)
            XCTAssert(reModel!.rect[0].size.height == 800)
            XCTAssert(reModel!.rect[1].origin.x == 10)
            XCTAssert(reModel!.rect[1].origin.y == 20)
            XCTAssert(reModel!.rect[1].size.width == 40)
            XCTAssert(reModel!.rect[1].size.height == 80)

            XCTAssert(reModel!.rectOpt!.count == 2)
            XCTAssert(reModel!.rectOpt![0].origin.x == 300)
            XCTAssert(reModel!.rectOpt![0].origin.y == 600)
            XCTAssert(reModel!.rectOpt![0].size.width == 900)
            XCTAssert(reModel!.rectOpt![0].size.height == 1200)
            XCTAssert(reModel!.rectOpt![1].origin.x == 30)
            XCTAssert(reModel!.rectOpt![1].origin.y == 60)
            XCTAssert(reModel!.rectOpt![1].size.width == 90)
            XCTAssert(reModel!.rectOpt![1].size.height == 120)

            XCTAssert(reModel!.rectOptNil == nil)
        }
    }

    func testEncodableDictionaryEncodingDecoding() {
        let fileName = "/tmp/encodableDict.plist"

        let model = EncodableDictionaryModel()

        model.rect = ["hey": EncodableRect(x: 100, y: 200, width: 400, height: 800),
            "now": EncodableRect(x: 10, y: 20, width: 40, height: 80)]
        model.rectOpt = ["one": EncodableRect(x: 300, y: 600, width: 900, height: 1200),
            "two": EncodableRect(x: 30, y: 60, width: 90, height: 120)]
        model.rectOptNil = nil

        Encoder(model).writeToFile(fileName)
        let reModel:EncodableDictionaryModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.rect.count == 2)
            XCTAssert(reModel!.rect["hey"] != nil)
            XCTAssert(reModel!.rect["hey"]!.origin.x == 100)
            XCTAssert(reModel!.rect["hey"]!.origin.y == 200)
            XCTAssert(reModel!.rect["hey"]!.size.width == 400)
            XCTAssert(reModel!.rect["hey"]!.size.height == 800)
            XCTAssert(reModel!.rect["now"] != nil)
            XCTAssert(reModel!.rect["now"]!.origin.x == 10)
            XCTAssert(reModel!.rect["now"]!.origin.y == 20)
            XCTAssert(reModel!.rect["now"]!.size.width == 40)
            XCTAssert(reModel!.rect["now"]!.size.height == 80)

            XCTAssert(reModel!.rectOpt!.count == 2)
            XCTAssert(reModel!.rectOpt!["one"] != nil)
            XCTAssert(reModel!.rectOpt!["one"]!.origin.x == 300)
            XCTAssert(reModel!.rectOpt!["one"]!.origin.y == 600)
            XCTAssert(reModel!.rectOpt!["one"]!.size.width == 900)
            XCTAssert(reModel!.rectOpt!["one"]!.size.height == 1200)
            XCTAssert(reModel!.rectOpt!["two"] != nil)
            XCTAssert(reModel!.rectOpt!["two"]!.origin.x == 30)
            XCTAssert(reModel!.rectOpt!["two"]!.origin.y == 60)
            XCTAssert(reModel!.rectOpt!["two"]!.size.width == 90)
            XCTAssert(reModel!.rectOpt!["two"]!.size.height == 120)

            XCTAssert(reModel!.rectOptNil == nil)
        }
    }

    func testConstEncodableDictionaryEncodingDecoding() {
        let fileName = "/tmp/constEncodableDict.plist"


        let rect = ["hey": EncodableRect(x: 100, y: 200, width: 400, height: 800),
            "now": EncodableRect(x: 10, y: 20, width: 40, height: 80)]
        let rectOpt = ["one": EncodableRect(x: 300, y: 600, width: 900, height: 1200),
            "two": EncodableRect(x: 30, y: 60, width: 90, height: 120)]

        let model = ConstEncodableDictionaryModel(rect: rect, rectOpt: rectOpt, rectOptNil: nil)

        Encoder(model).writeToFile(fileName)
        let reModel:ConstEncodableDictionaryModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.rect.count == 2)
            XCTAssert(reModel!.rect["hey"] != nil)
            XCTAssert(reModel!.rect["hey"]!.origin.x == 100)
            XCTAssert(reModel!.rect["hey"]!.origin.y == 200)
            XCTAssert(reModel!.rect["hey"]!.size.width == 400)
            XCTAssert(reModel!.rect["hey"]!.size.height == 800)
            XCTAssert(reModel!.rect["now"] != nil)
            XCTAssert(reModel!.rect["now"]!.origin.x == 10)
            XCTAssert(reModel!.rect["now"]!.origin.y == 20)
            XCTAssert(reModel!.rect["now"]!.size.width == 40)
            XCTAssert(reModel!.rect["now"]!.size.height == 80)

            XCTAssert(reModel!.rectOpt!.count == 2)
            XCTAssert(reModel!.rectOpt!["one"] != nil)
            XCTAssert(reModel!.rectOpt!["one"]!.origin.x == 300)
            XCTAssert(reModel!.rectOpt!["one"]!.origin.y == 600)
            XCTAssert(reModel!.rectOpt!["one"]!.size.width == 900)
            XCTAssert(reModel!.rectOpt!["one"]!.size.height == 1200)
            XCTAssert(reModel!.rectOpt!["two"] != nil)
            XCTAssert(reModel!.rectOpt!["two"]!.origin.x == 30)
            XCTAssert(reModel!.rectOpt!["two"]!.origin.y == 60)
            XCTAssert(reModel!.rectOpt!["two"]!.size.width == 90)
            XCTAssert(reModel!.rectOpt!["two"]!.size.height == 120)

            XCTAssert(reModel!.rectOptNil == nil)
        }
    }
}
