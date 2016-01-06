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

protocol SignedIntegerEncoding {}

// MARK: Encoder

extension Encoder : SignedIntegerEncoding {
    // MARK: Integer utilities

    func encodedValueForInteger<T: SignedIntegerType>(int: T?) -> NSCoding? {
        guard let intVal = int else {
            return nil
        }
        if let x = intVal as? Int {
            return x
        } else if let x = intVal as? Int8 {
            return NSNumber(char: x)
        } else if let x = intVal as? Int16 {
            return NSNumber(short: x)
        } else if let x = intVal as? Int32 {
            return NSNumber(int: x)
        } else if let x = intVal as? Int64 {
            return NSNumber(longLong: x)
        }

        return nil
    }

    // MARK: Integer types

    func addInteger<T: SignedIntegerType>(int: T?, key:String?) {
        let val = encodedValueForInteger(int)

        if key == nil {
            setValueForCurrentKey(val)
        } else {
            setValue(key!, value: val)
        }
    }

    func addIntegerArray<T: SignedIntegerType>(integerArray: Array<T>?, key: String?) {
        guard let array = integerArray else {
            if key == nil {
                setValueForCurrentKey(nil)
            } else {
                setValue(key!, value: nil)
            }

            return
        }

        var encoded:[NSCoding] = []

        for int in array {
            if let val = encodedValueForInteger(int) {
                encoded.append(val)
            }
        }

        if key == nil {
            setValueForCurrentKey(encoded)
        } else {
            setValue(key!, value: encoded)
        }
    }

    func addIntegerDictionary<T: SignedIntegerType>(integerDict: [String: T]?, key: String?) {
        guard let dict = integerDict else {
            if key == nil {
                setValueForCurrentKey(nil)
            } else {
                setValue(key!, value: nil)
            }

            return
        }

        var encoded:[String: NSCoding] = [:]

        for (key, int) in dict {
            if let val = encodedValueForInteger(int) {
                encoded[key] = val
            }
        }

        if key == nil {
            setValueForCurrentKey(encoded)
        } else {
            setValue(key!, value: encoded)
        }
    }
}

extension Decoder : SignedIntegerEncoding {
    // MARK: Integer utilities

    func decodedIntegerForValue<T: SignedIntegerType>(val: NSCoding?) -> T? {
        guard let intVal = val as? NSNumber else {
            return nil
        }

        let dt = T.self

        if dt == Int.self || dt == Int?.self {
            return intVal.integerValue as? T
        } else if dt == Int8.self || dt == Int8?.self {
            return intVal.charValue as? T
        } else if dt == Int16.self || dt == Int16?.self {
            return intVal.shortValue as? T
        } else if dt == Int32.self || dt == Int32?.self {
            return intVal.intValue as? T
        } else if dt == Int64.self || dt == Int64?.self {
            return intVal.longLongValue as? T
        }

        return nil
    }

    // MARK: Integer types

    func integer<T: SignedIntegerType>(key:String?) -> T? {
        let val = ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? NSNumber

        let decodedVal: T? = decodedIntegerForValue(val)

        return decodedVal
    }

    func integerArray<T: SignedIntegerType>(key: String?) -> Array<T>? {
        let val = ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? Array<NSNumber>

        guard val != nil else {
            return nil
        }

        var decoded: [T] = []

        for ele in val! {
            if let decodedVal: T = decodedIntegerForValue(ele) {
                decoded.append(decodedVal)
            }
        }

        return decoded
    }

    func integerDictionary<T: SignedIntegerType>(key: String?) -> [String : T]? {
        let val = ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? [String : NSNumber]

        guard val != nil else {
            return nil
        }

        var decoded: [String : T] = [:]

        for (key, ele) in val! {
            if let decodedVal: T = decodedIntegerForValue(ele) {
                decoded[key] = decodedVal
            }
        }

        return decoded
    }
}