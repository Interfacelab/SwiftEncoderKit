//
//  QuartzCoreTests.swift
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

class QuartzCoreTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testRectEncodeDecode() {
        let fileName = "/tmp/cgrect.plist"

        let model = CGRectModel()

        model.rect = CGRect(x: 45, y: 32, width: 120, height: 240)
        model.rectOpt = CGRect(x: 145, y: 132, width: 1202, height: 2401)
        model.rectOptNil = nil

        model.rectA = [CGRect(x: 145, y: 132, width: 1202, height: 2401),
            CGRect(x: 45, y: 132, width: 202, height: 401)]
        model.rectOptA = [CGRect(x: 15, y: 121, width: 12, height: 81),
            CGRect(x: 95, y: 152, width: 222, height: 601)]
        model.rectOptNilA = nil

        model.rectD = ["a": CGRect(x: 145, y: 132, width: 1202, height: 2401),
            "b": CGRect(x: 45, y: 132, width: 202, height: 401)]
        model.rectOptD = ["c": CGRect(x: 15, y: 121, width: 12, height: 81),
            "d": CGRect(x: 95, y: 152, width: 222, height: 601)]
        model.rectOptNilD = nil

        Encoder(model).writeToFile(fileName)
        let reModel:CGRectModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.rect == CGRect(x: 45, y: 32, width: 120, height: 240))
            XCTAssert(reModel!.rectOpt! == CGRect(x: 145, y: 132, width: 1202, height: 2401))
            XCTAssert(reModel!.rectOptNil == nil)

            XCTAssert(reModel!.rectA == [CGRect(x: 145, y: 132, width: 1202, height: 2401),
                CGRect(x: 45, y: 132, width: 202, height: 401)])
            XCTAssert(reModel!.rectOptA! == [CGRect(x: 15, y: 121, width: 12, height: 81),
                CGRect(x: 95, y: 152, width: 222, height: 601)])
            XCTAssert(reModel!.rectOptNilA == nil)

            XCTAssert(reModel!.rectD == ["a": CGRect(x: 145, y: 132, width: 1202, height: 2401),
                "b": CGRect(x: 45, y: 132, width: 202, height: 401)])
            XCTAssert(reModel!.rectOptD! == ["c": CGRect(x: 15, y: 121, width: 12, height: 81),
                "d": CGRect(x: 95, y: 152, width: 222, height: 601)])
            XCTAssert(reModel!.rectOptNilD == nil)
        }

    }

    func testConstRectEncodeDecode() {
        let fileName = "/tmp/cgrect-const.plist"

        let rect = CGRect(x: 45, y: 32, width: 120, height: 240)
        let rectOpt = CGRect(x: 145, y: 132, width: 1202, height: 2401)

        let rectA = [CGRect(x: 145, y: 132, width: 1202, height: 2401),
            CGRect(x: 45, y: 132, width: 202, height: 401)]
        let rectOptA = [CGRect(x: 15, y: 121, width: 12, height: 81),
            CGRect(x: 95, y: 152, width: 222, height: 601)]

        let rectD = ["a": CGRect(x: 145, y: 132, width: 1202, height: 2401),
            "b": CGRect(x: 45, y: 132, width: 202, height: 401)]
        let rectOptD = ["c": CGRect(x: 15, y: 121, width: 12, height: 81),
            "d": CGRect(x: 95, y: 152, width: 222, height: 601)]

        let model = ConstCGRectModel(rect: rect,
            rectOpt: rectOpt,
            rectOptNil: nil,
            rectA: rectA,
            rectOptA: rectOptA,
            rectOptNilA: nil,
            rectD: rectD,
            rectOptD: rectOptD,
            rectOptNilD: nil)

        Encoder(model).writeToFile(fileName)
        let reModel:ConstCGRectModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.rect == CGRect(x: 45, y: 32, width: 120, height: 240))
            XCTAssert(reModel!.rectOpt! == CGRect(x: 145, y: 132, width: 1202, height: 2401))
            XCTAssert(reModel!.rectOptNil == nil)

            XCTAssert(reModel!.rectA == [CGRect(x: 145, y: 132, width: 1202, height: 2401),
                CGRect(x: 45, y: 132, width: 202, height: 401)])
            XCTAssert(reModel!.rectOptA! == [CGRect(x: 15, y: 121, width: 12, height: 81),
                CGRect(x: 95, y: 152, width: 222, height: 601)])
            XCTAssert(reModel!.rectOptNilA == nil)

            XCTAssert(reModel!.rectD == ["a": CGRect(x: 145, y: 132, width: 1202, height: 2401),
                "b": CGRect(x: 45, y: 132, width: 202, height: 401)])
            XCTAssert(reModel!.rectOptD! == ["c": CGRect(x: 15, y: 121, width: 12, height: 81),
                "d": CGRect(x: 95, y: 152, width: 222, height: 601)])
            XCTAssert(reModel!.rectOptNilD == nil)
        }
        
    }

    func testCGVectorEncodeDecode() {
        let fileName = "/tmp/cgvector.plist"

        let model = CGVectorModel()

        model.vector = CGVector(dx: 10, dy: 50)
        model.vectorOpt = CGVector(dx: 110, dy: 150)
        model.vectorOptNil = nil

        model.vectorA = [CGVector(dx: 10, dy: 50), CGVector(dx: 110, dy: 150)]
        model.vectorOptA = [CGVector(dx: 30, dy: 20), CGVector(dx: 2, dy: 0)]
        model.vectorOptNil = nil

        model.vectorD = ["a": CGVector(dx: 10, dy: 50), "c": CGVector(dx: 110, dy: 150)]
        model.vectorOptD = ["c": CGVector(dx: 30, dy: 20), "d": CGVector(dx: 2, dy: 0)]
        model.vectorOptNil = nil

        Encoder(model).writeToFile(fileName)
        let reModel:CGVectorModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.vector == CGVector(dx: 10, dy: 50))
            XCTAssert(reModel!.vectorOpt! == CGVector(dx: 110, dy: 150))
            XCTAssert(reModel!.vectorOptNil == nil)

            XCTAssert(reModel!.vectorA == [CGVector(dx: 10, dy: 50), CGVector(dx: 110, dy: 150)])
            XCTAssert(reModel!.vectorOptA! == [CGVector(dx: 30, dy: 20), CGVector(dx: 2, dy: 0)])
            XCTAssert(reModel!.vectorOptNil == nil)

            XCTAssert(reModel!.vectorD == ["a": CGVector(dx: 10, dy: 50), "c": CGVector(dx: 110, dy: 150)])
            XCTAssert(reModel!.vectorOptD! == ["c": CGVector(dx: 30, dy: 20), "d": CGVector(dx: 2, dy: 0)])
            XCTAssert(reModel!.vectorOptNil == nil)
        }
    }

    func testConstCGVectorEncodeDecode() {
        let fileName = "/tmp/const-cgvector.plist"


        let vector = CGVector(dx: 10, dy: 50)
        let vectorOpt = CGVector(dx: 110, dy: 150)

        let vectorA = [CGVector(dx: 10, dy: 50), CGVector(dx: 110, dy: 150)]
        let vectorOptA = [CGVector(dx: 30, dy: 20), CGVector(dx: 2, dy: 0)]

        let vectorD = ["a": CGVector(dx: 10, dy: 50), "c": CGVector(dx: 110, dy: 150)]
        let vectorOptD = ["c": CGVector(dx: 30, dy: 20), "d": CGVector(dx: 2, dy: 0)]

        let model = ConstCGVectorModel(vector: vector,
            vectorOpt: vectorOpt,
            vectorOptNil: nil,
            vectorA: vectorA,
            vectorOptA: vectorOptA,
            vectorOptNilA: nil,
            vectorD: vectorD,
            vectorOptD: vectorOptD,
            vectorOptNilD: nil)

        Encoder(model).writeToFile(fileName)
        let reModel:ConstCGVectorModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.vector == CGVector(dx: 10, dy: 50))
            XCTAssert(reModel!.vectorOpt! == CGVector(dx: 110, dy: 150))
            XCTAssert(reModel!.vectorOptNil == nil)

            XCTAssert(reModel!.vectorA == [CGVector(dx: 10, dy: 50), CGVector(dx: 110, dy: 150)])
            XCTAssert(reModel!.vectorOptA! == [CGVector(dx: 30, dy: 20), CGVector(dx: 2, dy: 0)])
            XCTAssert(reModel!.vectorOptNil == nil)

            XCTAssert(reModel!.vectorD == ["a": CGVector(dx: 10, dy: 50), "c": CGVector(dx: 110, dy: 150)])
            XCTAssert(reModel!.vectorOptD! == ["c": CGVector(dx: 30, dy: 20), "d": CGVector(dx: 2, dy: 0)])
            XCTAssert(reModel!.vectorOptNil == nil)
        }
    }

    func testCGAffineTransformEncodeDecode() {
        let fileName = "/tmp/cgaffine.plist"

        let model = CGAffineTransformModel()

        model.transform = CGAffineTransformMakeScale(1.0, 2.0)
        model.transformOpt = CGAffineTransformMakeScale(3.0, 4.0)
        model.transformOptNil = nil

        model.transformA = [CGAffineTransformMakeScale(1.0, 2.0),
            CGAffineTransformMakeScale(4.0, 8.0)]
        model.transformOptA = [CGAffineTransformMakeScale(3.0, 4.0),
            CGAffineTransformMakeScale(9.0, 1.0)]
        model.transformOptNilA = nil

        model.transformD = ["a": CGAffineTransformMakeScale(1.0, 2.0),
            "b": CGAffineTransformMakeScale(4.0, 8.0)]
        model.transformOptD = ["c": CGAffineTransformMakeScale(3.0, 4.0),
            "d": CGAffineTransformMakeScale(9.0, 1.0)]
        model.transformOptNilD = nil

        Encoder(model).writeToFile(fileName)
        let reModel:CGAffineTransformModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(CGAffineTransformEqualToTransform(reModel!.transform, CGAffineTransformMakeScale(1.0, 2.0)))
            XCTAssert(CGAffineTransformEqualToTransform(reModel!.transformOpt!, CGAffineTransformMakeScale(3.0, 4.0)))
            XCTAssert(reModel!.transformOptNil == nil)

            XCTAssert(CGAffineTransformEqualToTransform(reModel!.transformA[0], CGAffineTransformMakeScale(1.0, 2.0)))
            XCTAssert(CGAffineTransformEqualToTransform(reModel!.transformA[1], CGAffineTransformMakeScale(4.0, 8.0)))
            XCTAssert(CGAffineTransformEqualToTransform(reModel!.transformOptA![0], CGAffineTransformMakeScale(3.0, 4.0)))
            XCTAssert(CGAffineTransformEqualToTransform(reModel!.transformOptA![1], CGAffineTransformMakeScale(9.0, 1.0)))
            XCTAssert(reModel!.transformOptNilA == nil)

            XCTAssert(CGAffineTransformEqualToTransform(reModel!.transformD["a"]!, CGAffineTransformMakeScale(1.0, 2.0)))
            XCTAssert(CGAffineTransformEqualToTransform(reModel!.transformD["b"]!, CGAffineTransformMakeScale(4.0, 8.0)))
            XCTAssert(CGAffineTransformEqualToTransform(reModel!.transformOptD!["c"]!, CGAffineTransformMakeScale(3.0, 4.0)))
            XCTAssert(CGAffineTransformEqualToTransform(reModel!.transformOptD!["d"]!, CGAffineTransformMakeScale(9.0, 1.0)))
            XCTAssert(reModel!.transformOptNilD == nil)
        }
    }

    func testConstCGAffineTransformEncodeDecode() {
        let fileName = "/tmp/const-cgaffine.plist"

        let transform = CGAffineTransformMakeScale(1.0, 2.0)
        let transformOpt = CGAffineTransformMakeScale(3.0, 4.0)

        let transformA = [CGAffineTransformMakeScale(1.0, 2.0),
            CGAffineTransformMakeScale(4.0, 8.0)]
        let transformOptA = [CGAffineTransformMakeScale(3.0, 4.0),
            CGAffineTransformMakeScale(9.0, 1.0)]

        let transformD = ["a": CGAffineTransformMakeScale(1.0, 2.0),
            "b": CGAffineTransformMakeScale(4.0, 8.0)]
        let transformOptD = ["c": CGAffineTransformMakeScale(3.0, 4.0),
            "d": CGAffineTransformMakeScale(9.0, 1.0)]

        let model = ConstCGAffineTransformModel(transform: transform,
            transformOpt: transformOpt,
            transformOptNil: nil,
            transformA: transformA,
            transformOptA: transformOptA,
            transformOptNilA: nil,
            transformD: transformD,
            transformOptD: transformOptD,
            transformOptNilD: nil)

        Encoder(model).writeToFile(fileName)
        let reModel:ConstCGAffineTransformModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(CGAffineTransformEqualToTransform(reModel!.transform, CGAffineTransformMakeScale(1.0, 2.0)))
            XCTAssert(CGAffineTransformEqualToTransform(reModel!.transformOpt!, CGAffineTransformMakeScale(3.0, 4.0)))
            XCTAssert(reModel!.transformOptNil == nil)

            XCTAssert(CGAffineTransformEqualToTransform(reModel!.transformA[0], CGAffineTransformMakeScale(1.0, 2.0)))
            XCTAssert(CGAffineTransformEqualToTransform(reModel!.transformA[1], CGAffineTransformMakeScale(4.0, 8.0)))
            XCTAssert(CGAffineTransformEqualToTransform(reModel!.transformOptA![0], CGAffineTransformMakeScale(3.0, 4.0)))
            XCTAssert(CGAffineTransformEqualToTransform(reModel!.transformOptA![1], CGAffineTransformMakeScale(9.0, 1.0)))
            XCTAssert(reModel!.transformOptNilA == nil)

            XCTAssert(CGAffineTransformEqualToTransform(reModel!.transformD["a"]!, CGAffineTransformMakeScale(1.0, 2.0)))
            XCTAssert(CGAffineTransformEqualToTransform(reModel!.transformD["b"]!, CGAffineTransformMakeScale(4.0, 8.0)))
            XCTAssert(CGAffineTransformEqualToTransform(reModel!.transformOptD!["c"]!, CGAffineTransformMakeScale(3.0, 4.0)))
            XCTAssert(CGAffineTransformEqualToTransform(reModel!.transformOptD!["d"]!, CGAffineTransformMakeScale(9.0, 1.0)))
            XCTAssert(reModel!.transformOptNilD == nil)
        }
    }

}
