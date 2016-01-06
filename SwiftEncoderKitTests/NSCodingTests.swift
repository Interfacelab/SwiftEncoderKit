//
//  NSCodingTests.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import XCTest

class NSCodingTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testNSCodingEncodingDecoding() {
        let fileName = "/tmp/nscoding.plist"

        let bundle = NSBundle(forClass: self.dynamicType)
        let path = bundle.pathForResource("test-image", ofType: "jpg")
        let image = UIImage(contentsOfFile: path!)!

        let model = NSCodingModel()

        model.image = UIImage(contentsOfFile: path!)!
        model.imageOpt = UIImage(contentsOfFile: path!)
        model.imageOptNil = nil

        model.color = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        model.colorOpt = UIColor(red:1.0, green: 1.0, blue: 0.0, alpha: 1.0)
        model.colorOptNil = nil

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile(fileName)

        let decoder=Decoder(path: fileName)
        let reModel = NSCodingModel(decoder)

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.image.size == image.size)
            XCTAssert(reModel!.imageOpt!.size == image.size)

            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0

            reModel!.color.getRed(&r, green: &g, blue: &b, alpha: &a)
            XCTAssert(r == 1.0)
            XCTAssert(g == 0.0)
            XCTAssert(b == 0.0)
            XCTAssert(a == 1.0)

            reModel!.colorOpt!.getRed(&r, green: &g, blue: &b, alpha: &a)
            XCTAssert(r == 1.0)
            XCTAssert(g == 1.0)
            XCTAssert(b == 0.0)
            XCTAssert(a == 1.0)
        }
    }

    func testArrayEncodingDecoding() {
        let fileName = "/tmp/nscodingArray.plist"

        let bundle = NSBundle(forClass: self.dynamicType)
        let path = bundle.pathForResource("test-image", ofType: "jpg")
        let image = UIImage(contentsOfFile: path!)!

        let model = NSCodingArrayModel()

        model.imageA = [UIImage(contentsOfFile: path!)!,UIImage(contentsOfFile: path!)!]
        model.imageOptA = [UIImage(contentsOfFile: path!)!,UIImage(contentsOfFile: path!)!,
            UIImage(contentsOfFile: path!)!]
        model.imageOptNilA = nil


        model.colorA = [UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0),
            UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)]
        model.colorOptA = [UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0),
            UIColor(red: 1.0, green: 0.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0,
                blue: 0.0, alpha: 1.0)]
        model.colorOptNilA = nil

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile(fileName)

        let decoder=Decoder(path: fileName)
        let reModel = NSCodingArrayModel(decoder)

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.imageA.count == 2)
            for img in reModel!.imageA {
                XCTAssert(img.size == image.size)
            }

            XCTAssert(reModel!.imageOptA!.count == 3)
            for img in reModel!.imageOptA! {
                XCTAssert(img.size == image.size)
            }

            XCTAssert(reModel!.imageOptNilA == nil)

            XCTAssert(reModel!.colorA.count == 2)
            XCTAssert(reModel!.colorOptA!.count == 3)

            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0

            reModel!.colorA[0].getRed(&r, green: &g, blue: &b, alpha: &a)
            XCTAssert(r == 1.0)
            XCTAssert(g == 0.0)
            XCTAssert(b == 0.0)
            XCTAssert(a == 1.0)

            reModel!.colorA[1].getRed(&r, green: &g, blue: &b, alpha: &a)
            XCTAssert(r == 0.0)
            XCTAssert(g == 1.0)
            XCTAssert(b == 0.0)
            XCTAssert(a == 1.0)

            reModel!.colorOptA![0].getRed(&r, green: &g, blue: &b, alpha: &a)
            XCTAssert(r == 0.0)
            XCTAssert(g == 1.0)
            XCTAssert(b == 1.0)
            XCTAssert(a == 1.0)

            reModel!.colorOptA![1].getRed(&r, green: &g, blue: &b, alpha: &a)
            XCTAssert(r == 1.0)
            XCTAssert(g == 0.0)
            XCTAssert(b == 1.0)
            XCTAssert(a == 1.0)


            reModel!.colorOptA![2].getRed(&r, green: &g, blue: &b, alpha: &a)
            XCTAssert(r == 1.0)
            XCTAssert(g == 1.0)
            XCTAssert(b == 0.0)
            XCTAssert(a == 1.0)
        }
    }

    func testConstNSCodingEncodingDecoding() {
        let fileName = "/tmp/constNSCoding.plist"

        let bundle = NSBundle(forClass: self.dynamicType)
        let path = bundle.pathForResource("test-image", ofType: "jpg")
        let image = UIImage(contentsOfFile: path!)!

        let model = ConstNSCodingModel(image: UIImage(contentsOfFile: path!)!,
            imageOpt: UIImage(contentsOfFile: path!)!, imageOptNil: nil,
                color: UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0),
                colorOpt: UIColor(red:1.0, green: 1.0, blue: 0.0, alpha: 1.0), colorOptNil: nil)

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile(fileName)

        let decoder=Decoder(path: fileName)
        let reModel = ConstNSCodingModel(decoder)

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.image.size == image.size)
            XCTAssert(reModel!.imageOpt!.size == image.size)

            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0

            reModel!.color.getRed(&r, green: &g, blue: &b, alpha: &a)
            XCTAssert(r == 1.0)
            XCTAssert(g == 0.0)
            XCTAssert(b == 0.0)
            XCTAssert(a == 1.0)

            reModel!.colorOpt!.getRed(&r, green: &g, blue: &b, alpha: &a)
            XCTAssert(r == 1.0)
            XCTAssert(g == 1.0)
            XCTAssert(b == 0.0)
            XCTAssert(a == 1.0)
        }
    }

    func testConstArrayEncodingDecoding() {
        let fileName = "/tmp/constNSCodingArray.plist"

        let bundle = NSBundle(forClass: self.dynamicType)
        let path = bundle.pathForResource("test-image", ofType: "jpg")
        let image = UIImage(contentsOfFile: path!)!

        let imageA = [UIImage(contentsOfFile: path!)!,UIImage(contentsOfFile: path!)!]
        let imageOptA = [UIImage(contentsOfFile: path!)!,UIImage(contentsOfFile: path!)!,
            UIImage(contentsOfFile: path!)!]

        let colorA = [UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0),
            UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)]
        let colorOptA = [UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0),
            UIColor(red: 1.0, green: 0.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0,
                blue: 0.0, alpha: 1.0)]

        let model = ConstNSCodingArrayModel(imageA: imageA, imageOptA: imageOptA, imageOptNilA: nil,
            colorA: colorA, colorOptA: colorOptA, colorOptNilA: nil)

        let encoder=Encoder()
        model.encode(encoder)
        encoder.writeToFile(fileName)

        let decoder=Decoder(path: fileName)
        let reModel = ConstNSCodingArrayModel(decoder)

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.imageA.count == 2)
            for img in reModel!.imageA {
                XCTAssert(img.size == image.size)
            }

            XCTAssert(reModel!.imageOptA!.count == 3)
            for img in reModel!.imageOptA! {
                XCTAssert(img.size == image.size)
            }

            XCTAssert(reModel!.imageOptNilA == nil)

            XCTAssert(reModel!.colorA.count == 2)
            XCTAssert(reModel!.colorOptA!.count == 3)

            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0

            reModel!.colorA[0].getRed(&r, green: &g, blue: &b, alpha: &a)
            XCTAssert(r == 1.0)
            XCTAssert(g == 0.0)
            XCTAssert(b == 0.0)
            XCTAssert(a == 1.0)

            reModel!.colorA[1].getRed(&r, green: &g, blue: &b, alpha: &a)
            XCTAssert(r == 0.0)
            XCTAssert(g == 1.0)
            XCTAssert(b == 0.0)
            XCTAssert(a == 1.0)

            reModel!.colorOptA![0].getRed(&r, green: &g, blue: &b, alpha: &a)
            XCTAssert(r == 0.0)
            XCTAssert(g == 1.0)
            XCTAssert(b == 1.0)
            XCTAssert(a == 1.0)

            reModel!.colorOptA![1].getRed(&r, green: &g, blue: &b, alpha: &a)
            XCTAssert(r == 1.0)
            XCTAssert(g == 0.0)
            XCTAssert(b == 1.0)
            XCTAssert(a == 1.0)

            reModel!.colorOptA![2].getRed(&r, green: &g, blue: &b, alpha: &a)
            XCTAssert(r == 1.0)
            XCTAssert(g == 1.0)
            XCTAssert(b == 0.0)
            XCTAssert(a == 1.0)
        }
    }
}
