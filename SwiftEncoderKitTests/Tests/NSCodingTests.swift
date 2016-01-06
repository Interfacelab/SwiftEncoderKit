//
//  NSCodingTests.swift
//  SwiftEncoderKit
//
//  Created by Jon Gilkison on 1/2/16.
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

class NSCodingTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    // MARK: Basic encoding

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

        Encoder(model).writeToFile(fileName)
        let reModel:NSCodingModel? = Decoder(path: fileName).decodedObject()

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

            XCTAssert(reModel!.colorOptNil == nil)
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

        Encoder(model).writeToFile(fileName)
        let reModel:ConstNSCodingModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.image.size == image.size)
            XCTAssert(reModel!.imageOpt!.size == image.size)
            XCTAssert(reModel!.imageOptNil == nil)

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

            XCTAssert(reModel!.colorOptNil == nil)
        }
    }

    // MARK: Array Encoding

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

        Encoder(model).writeToFile(fileName)
        let reModel:NSCodingArrayModel? = Decoder(path: fileName).decodedObject()

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
            XCTAssert(reModel!.colorOptNilA == nil)

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

        Encoder(model).writeToFile(fileName)
        let reModel:ConstNSCodingArrayModel? = Decoder(path: fileName).decodedObject()

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
            XCTAssert(reModel!.colorOptNilA == nil)

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

    // MARK: Dictionary

    func testDictionaryEncodingDecoding() {
        let fileName = "/tmp/nscodingDict.plist"

        let bundle = NSBundle(forClass: self.dynamicType)
        let path = bundle.pathForResource("test-image", ofType: "jpg")
        let image = UIImage(contentsOfFile: path!)!

        let model = NSCodingDictionaryModel()

        model.imageD = ["a": UIImage(contentsOfFile: path!)!, "b": UIImage(contentsOfFile: path!)!]
        model.imageOptD = ["a": UIImage(contentsOfFile: path!)!,
            "b": UIImage(contentsOfFile: path!)!, "c": UIImage(contentsOfFile: path!)!]
        model.imageOptNilD = nil

        model.colorD = ["a": UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0),
            "b": UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)]
        model.colorOptD = ["a": UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0),
            "b": UIColor(red: 1.0, green: 0.0, blue: 1.0, alpha: 1.0),
            "c": UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0)]
        model.colorOptNilD = nil

        Encoder(model).writeToFile(fileName)
        let reModel:NSCodingDictionaryModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.imageD.count == 2)
            XCTAssert(reModel!.imageD["a"] != nil)
            XCTAssert(reModel!.imageD["b"] != nil)
            XCTAssert(reModel!.imageD["a"]!.size == image.size)
            XCTAssert(reModel!.imageD["b"]!.size == image.size)

            XCTAssert(reModel!.imageOptD != nil)
            XCTAssert(reModel!.imageOptD!.count == 3)
            XCTAssert(reModel!.imageOptD!["a"] != nil)
            XCTAssert(reModel!.imageOptD!["b"] != nil)
            XCTAssert(reModel!.imageOptD!["c"] != nil)
            XCTAssert(reModel!.imageOptD!["a"]!.size == image.size)
            XCTAssert(reModel!.imageOptD!["b"]!.size == image.size)
            XCTAssert(reModel!.imageOptD!["c"]!.size == image.size)

            XCTAssert(reModel!.imageOptNilD == nil)

            XCTAssert(reModel!.colorD.count == 2)
            XCTAssert(reModel!.colorD["a"] != nil)
            XCTAssert(reModel!.colorD["b"] != nil)

            XCTAssert(reModel!.colorOptD!.count == 3)
            XCTAssert(reModel!.colorOptD!["a"] != nil)
            XCTAssert(reModel!.colorOptD!["b"] != nil)
            XCTAssert(reModel!.colorOptD!["c"] != nil)

            XCTAssert(reModel!.colorOptNilD == nil)

            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0

            reModel!.colorD["a"]!.getRed(&r, green: &g, blue: &b, alpha: &a)
            XCTAssert(r == 1.0)
            XCTAssert(g == 0.0)
            XCTAssert(b == 0.0)
            XCTAssert(a == 1.0)

            reModel!.colorD["b"]!.getRed(&r, green: &g, blue: &b, alpha: &a)
            XCTAssert(r == 0.0)
            XCTAssert(g == 1.0)
            XCTAssert(b == 0.0)
            XCTAssert(a == 1.0)

            reModel!.colorOptD!["a"]!.getRed(&r, green: &g, blue: &b, alpha: &a)
            XCTAssert(r == 0.0)
            XCTAssert(g == 1.0)
            XCTAssert(b == 1.0)
            XCTAssert(a == 1.0)

            reModel!.colorOptD!["b"]!.getRed(&r, green: &g, blue: &b, alpha: &a)
            XCTAssert(r == 1.0)
            XCTAssert(g == 0.0)
            XCTAssert(b == 1.0)
            XCTAssert(a == 1.0)


            reModel!.colorOptD!["c"]!.getRed(&r, green: &g, blue: &b, alpha: &a)
            XCTAssert(r == 1.0)
            XCTAssert(g == 1.0)
            XCTAssert(b == 0.0)
            XCTAssert(a == 1.0)
        }
    }

    func testConstDictionaryEncodingDecoding() {
        let fileName = "/tmp/constNSCodingDict.plist"

        let bundle = NSBundle(forClass: self.dynamicType)
        let path = bundle.pathForResource("test-image", ofType: "jpg")
        let image = UIImage(contentsOfFile: path!)!


        let imageD = ["a": UIImage(contentsOfFile: path!)!, "b": UIImage(contentsOfFile: path!)!]
        let imageOptD = ["a": UIImage(contentsOfFile: path!)!,
            "b": UIImage(contentsOfFile: path!)!, "c": UIImage(contentsOfFile: path!)!]

        let colorD = ["a": UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0),
            "b": UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)]
        let colorOptD = ["a": UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0),
            "b": UIColor(red: 1.0, green: 0.0, blue: 1.0, alpha: 1.0),
            "c": UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0)]

        let model = ConstNSCodingDictionaryModel(imageD: imageD, imageOptD: imageOptD,
            imageOptNilD: nil, colorD: colorD, colorOptD: colorOptD, colorOptNilD: nil)

        Encoder(model).writeToFile(fileName)
        let reModel:ConstNSCodingDictionaryModel? = Decoder(path: fileName).decodedObject()

        XCTAssert(reModel != nil)

        if reModel != nil {
            XCTAssert(reModel!.imageD.count == 2)
            XCTAssert(reModel!.imageD["a"] != nil)
            XCTAssert(reModel!.imageD["b"] != nil)
            XCTAssert(reModel!.imageD["a"]!.size == image.size)
            XCTAssert(reModel!.imageD["b"]!.size == image.size)

            XCTAssert(reModel!.imageOptD != nil)
            XCTAssert(reModel!.imageOptD!.count == 3)
            XCTAssert(reModel!.imageOptD!["a"] != nil)
            XCTAssert(reModel!.imageOptD!["b"] != nil)
            XCTAssert(reModel!.imageOptD!["c"] != nil)
            XCTAssert(reModel!.imageOptD!["a"]!.size == image.size)
            XCTAssert(reModel!.imageOptD!["b"]!.size == image.size)
            XCTAssert(reModel!.imageOptD!["c"]!.size == image.size)

            XCTAssert(reModel!.imageOptNilD == nil)

            XCTAssert(reModel!.colorD.count == 2)
            XCTAssert(reModel!.colorD["a"] != nil)
            XCTAssert(reModel!.colorD["b"] != nil)

            XCTAssert(reModel!.colorOptD!.count == 3)
            XCTAssert(reModel!.colorOptD!["a"] != nil)
            XCTAssert(reModel!.colorOptD!["b"] != nil)
            XCTAssert(reModel!.colorOptD!["c"] != nil)

            XCTAssert(reModel!.colorOptNilD == nil)

            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0

            reModel!.colorD["a"]!.getRed(&r, green: &g, blue: &b, alpha: &a)
            XCTAssert(r == 1.0)
            XCTAssert(g == 0.0)
            XCTAssert(b == 0.0)
            XCTAssert(a == 1.0)

            reModel!.colorD["b"]!.getRed(&r, green: &g, blue: &b, alpha: &a)
            XCTAssert(r == 0.0)
            XCTAssert(g == 1.0)
            XCTAssert(b == 0.0)
            XCTAssert(a == 1.0)

            reModel!.colorOptD!["a"]!.getRed(&r, green: &g, blue: &b, alpha: &a)
            XCTAssert(r == 0.0)
            XCTAssert(g == 1.0)
            XCTAssert(b == 1.0)
            XCTAssert(a == 1.0)

            reModel!.colorOptD!["b"]!.getRed(&r, green: &g, blue: &b, alpha: &a)
            XCTAssert(r == 1.0)
            XCTAssert(g == 0.0)
            XCTAssert(b == 1.0)
            XCTAssert(a == 1.0)


            reModel!.colorOptD!["c"]!.getRed(&r, green: &g, blue: &b, alpha: &a)
            XCTAssert(r == 1.0)
            XCTAssert(g == 1.0)
            XCTAssert(b == 0.0)
            XCTAssert(a == 1.0)
        }
    }
}
