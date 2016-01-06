//
//  BasicTypesExtension.swift
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


import Foundation
import QuartzCore

protocol FloatEncoding {}

// MARK: Encoder

extension Encoder : FloatEncoding {
    // MARK: Float and Double

    func addFloat(float: Float?, key: String?) {
        let val: NSNumber? = (float == nil) ? nil : NSNumber(float: float!)

        if key == nil {
            setValueForCurrentKey(val)
        } else {
            setValue(key!, value: val)
        }
    }

    func addFloatArray(floatArray: Array<Float>?, key: String?) {
        if key == nil {
            setValueForCurrentKey(floatArray)
        } else {
            setValue(key!, value: floatArray)
        }
    }

    func addFloatDictionary(floatDict: [String: Float]?, key: String?) {
        if key == nil {
            setValueForCurrentKey(floatDict)
        } else {
            setValue(key!, value: floatDict)
        }
    }

    // MARK: CGFloat

    func addCGFloat(float: CGFloat?, key: String?) {
        let val: NSNumber? = (float == nil) ? nil : NSNumber(float: Float(float!))

        if key == nil {
            setValueForCurrentKey(val)
        } else {
            setValue(key!, value: val)
        }
    }

    func addCGFloatArray(floatArray: Array<CGFloat>?, key: String?) {
        if key == nil {
            setValueForCurrentKey(floatArray)
        } else {
            setValue(key!, value: floatArray)
        }
    }

    func addCGFloatDictionary(floatDict: [String: CGFloat]?, key: String?) {
        if key == nil {
            setValueForCurrentKey(floatDict)
        } else {
            setValue(key!, value: floatDict)
        }
    }

    // MARK: Double

    func addDouble(double: Double?, key: String?) {
        let val: NSNumber? = (double == nil) ? nil : NSNumber(double: double!)

        if key == nil {
            setValueForCurrentKey(val)
        } else {
            setValue(key!, value: val)
        }
    }

    func addDoubleArray(doubleArray: Array<Double>?, key: String?) {
        if key == nil {
            setValueForCurrentKey(doubleArray)
        } else {
            setValue(key!, value: doubleArray)
        }
    }

    func addDoubleDictionary(doubleDict: [String: Double]?, key: String?) {
        if key == nil {
            setValueForCurrentKey(doubleDict)
        } else {
            setValue(key!, value: doubleDict)
        }
    }
}

// MARK: Decoder

extension Decoder : FloatEncoding {
    // MARK: Float

    func float(key: String?) -> Float? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? Float
    }

    func floatArray(key: String?) -> Array<Float>? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? Array<Float>
    }

    func floatDictionary(key: String?) -> [String: Float]? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? [String: Float]
    }

    // MARK: CGFloat

    func cgFloat(key: String?) -> CGFloat? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? CGFloat
    }

    func cgFloatArray(key: String?) -> Array<CGFloat>? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? Array<CGFloat>
    }

    func cgFloatDictionary(key: String?) -> [String: CGFloat]? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? [String: CGFloat]
    }

    // MARK: Double

    func double(key: String?) -> Double? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? Double
    }

    func doubleArray(key: String?) -> Array<Double>? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? Array<Double>
    }

    func doubleDictionary(key: String?) -> [String: Double]? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? [String: Double]
    }
}