//
//  NSCodingExtension.swift
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

protocol NSCodingEncoding {}

// MARK: Encoder

extension Encoder : NSCodingEncoding {
    func addNSCoding(object: NSCoding?, key: String?) {
        if key == nil {
            setValueForCurrentKey(object)
        }
        else {
            setValue(key!, value: object)
        }
    }

    func addNSCodingArray(objectArray: Array<NSCoding>?, key: String?) {
        if key == nil {
            setValueForCurrentKey(objectArray)
        }
        else {
            setValue(key!, value: objectArray)
        }
    }

    func addNSCodingDictionary<T: NSCoding>(objectDict: [String: T]?, key: String?) {
        if key == nil {
            setValueForCurrentKey(objectDict)
        } else {
            setValue(key!, value: objectDict)
        }
    }
}

// MARK: Decoder

extension Decoder : NSCodingEncoding {
    func nsCoding<T: NSCoding>(key: String?) -> T? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? T
    }

    func nsCodingArray<T: NSCoding>(key: String?) -> Array<T>? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? Array<T>
    }

    func nsCodingDictionary<T: NSCoding>(key: String?) -> [String: T]? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? [String: T]
    }
}