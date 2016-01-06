//
//  QuartzCoreTests.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/5/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import XCTest
import QuartzCore

class CoreAnimationTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCA3DTransformEncodingDecoding() {
        let fileName = "/tmp/catransform3d.plist"

        let model = CATransform3DModel()

        // These values were chosen to avoid rounding errors that happen when encoded/decoded
        // For example, 0.15 when decoded will become 0.1499999999999999999999

        model.t3d = CATransform3DMakeScale(5, 75, 1)
        model.t3dOpt = CATransform3DMakeScale(5, 10, 4)
        model.t3dOptNil = nil

        model.t3dA = [CATransform3DMakeScale(5, 75, 1), CATransform3DMakeScale(1, 2, 1)]
        model.t3dOptA = [CATransform3DMakeScale(15, 75, 4), CATransform3DMakeScale(10, 110, 14)]
        model.t3dOptNilA = nil

        model.t3dD = ["a": CATransform3DMakeScale(5, 75, 1), "b": CATransform3DMakeScale(1, 2, 1)]
        model.t3dOptD = ["c": CATransform3DMakeScale(15, 10, 4),
            "d": CATransform3DMakeScale(10, 110, 14)]
        model.t3dOptNilD = nil

        Encoder(model).writeToFile(fileName)
        let reModel:CATransform3DModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(CATransform3DEqualToTransform(reModel!.t3d, CATransform3DMakeScale(5, 75, 1)))
            XCTAssert(CATransform3DEqualToTransform(reModel!.t3dOpt!, CATransform3DMakeScale(5, 10, 4)))
            XCTAssert(reModel!.t3dOptNil == nil)

            XCTAssert(CATransform3DEqualToTransform(reModel!.t3dA[0], CATransform3DMakeScale(5, 75, 1)))
            XCTAssert(CATransform3DEqualToTransform(reModel!.t3dA[1], CATransform3DMakeScale(1, 2, 1)))
            XCTAssert(CATransform3DEqualToTransform(reModel!.t3dOptA![0], CATransform3DMakeScale(15, 75, 4)))
            XCTAssert(CATransform3DEqualToTransform(reModel!.t3dOptA![1], CATransform3DMakeScale(10, 110, 14)))
            XCTAssert(reModel!.t3dOptNilA == nil)

            XCTAssert(CATransform3DEqualToTransform(reModel!.t3dD["a"]!, CATransform3DMakeScale(5, 75, 1)))
            XCTAssert(CATransform3DEqualToTransform(reModel!.t3dD["b"]!, CATransform3DMakeScale(1, 2, 1)))
            XCTAssert(CATransform3DEqualToTransform(reModel!.t3dOptD!["c"]!, CATransform3DMakeScale(15, 10, 4)))
            XCTAssert(CATransform3DEqualToTransform(reModel!.t3dOptD!["d"]!, CATransform3DMakeScale(10, 110, 14)))
            XCTAssert(reModel!.t3dOptNilD == nil)
        }
    }

    func testConstCA3DTransformEncodingDecoding() {
        let fileName = "/tmp/catransform3d-const.plist"

        // These values were chosen to avoid rounding errors that happen when encoded/decoded
        // For example, 0.15 when decoded will become 0.1499999999999999999999

        let t3d = CATransform3DMakeScale(5, 75, 1)
        let t3dOpt = CATransform3DMakeScale(5, 10, 4)

        let t3dA = [CATransform3DMakeScale(5, 75, 1), CATransform3DMakeScale(1, 2, 1)]
        let t3dOptA = [CATransform3DMakeScale(15, 75, 4), CATransform3DMakeScale(10, 110, 14)]

        let t3dD = ["a": CATransform3DMakeScale(5, 75, 1), "b": CATransform3DMakeScale(1, 2, 1)]
        let t3dOptD = ["c": CATransform3DMakeScale(15, 10, 4),
            "d": CATransform3DMakeScale(10, 110, 14)]

        let model = ConstCATransform3DModel(t3d: t3d,
            t3dOpt: t3dOpt,
            t3dOptNil: nil,
            t3dA: t3dA,
            t3dOptA: t3dOptA,
            t3dOptNilA: nil,
            t3dD: t3dD,
            t3dOptD: t3dOptD,
            t3dOptNilD: nil)

        Encoder(model).writeToFile(fileName)
        let reModel:ConstCATransform3DModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(CATransform3DEqualToTransform(reModel!.t3d, CATransform3DMakeScale(5, 75, 1)))
            XCTAssert(CATransform3DEqualToTransform(reModel!.t3dOpt!, CATransform3DMakeScale(5, 10, 4)))
            XCTAssert(reModel!.t3dOptNil == nil)

            XCTAssert(CATransform3DEqualToTransform(reModel!.t3dA[0], CATransform3DMakeScale(5, 75, 1)))
            XCTAssert(CATransform3DEqualToTransform(reModel!.t3dA[1], CATransform3DMakeScale(1, 2, 1)))
            XCTAssert(CATransform3DEqualToTransform(reModel!.t3dOptA![0], CATransform3DMakeScale(15, 75, 4)))
            XCTAssert(CATransform3DEqualToTransform(reModel!.t3dOptA![1], CATransform3DMakeScale(10, 110, 14)))
            XCTAssert(reModel!.t3dOptNilA == nil)

            XCTAssert(CATransform3DEqualToTransform(reModel!.t3dD["a"]!, CATransform3DMakeScale(5, 75, 1)))
            XCTAssert(CATransform3DEqualToTransform(reModel!.t3dD["b"]!, CATransform3DMakeScale(1, 2, 1)))
            XCTAssert(CATransform3DEqualToTransform(reModel!.t3dOptD!["c"]!, CATransform3DMakeScale(15, 10, 4)))
            XCTAssert(CATransform3DEqualToTransform(reModel!.t3dOptD!["d"]!, CATransform3DMakeScale(10, 110, 14)))
            XCTAssert(reModel!.t3dOptNilD == nil)
        }
    }
}
