//
//  EnumEncoding.swift
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


import Foundation

protocol EnumEncoding {}

extension Encoder : EnumEncoding {
    func encodedEnumValue<T: RawRepresentable>(enumValue: T?) -> NSCoding? {
        guard enumValue != nil else {
            return nil
        }

        if let x = enumValue!.rawValue as? Int {
            return NSNumber(integer: x)
        } else if let x = enumValue!.rawValue as? Int8 {
            return NSNumber(char: x)
        } else if let x = enumValue!.rawValue as? Int16 {
            return NSNumber(short: x)
        } else if let x = enumValue!.rawValue as? Int32 {
            return NSNumber(int: x)
        } else if let x = enumValue!.rawValue as? Int64 {
            return NSNumber(longLong: x)
        } else if let x = enumValue!.rawValue as? UInt {
            return NSNumber(unsignedInteger: x)
        } else if let x = enumValue!.rawValue as? UInt8 {
            return NSNumber(unsignedChar: x)
        } else if let x = enumValue!.rawValue as? UInt16 {
            return NSNumber(unsignedShort: x)
        } else if let x = enumValue!.rawValue as? UInt32 {
            return NSNumber(unsignedInt: x)
        } else if let x = enumValue!.rawValue as? UInt64 {
            return NSNumber(unsignedLongLong: x)
        } else if let x = enumValue!.rawValue as? Float {
            return x
        } else if let x = enumValue!.rawValue as? Double {
            return x
        } else if let x = enumValue!.rawValue as? String {
            return x
        } else if let x = enumValue!.rawValue as? Character {
            return String(x)
        }

        return nil
    }

    func addEnumValue<T: RawRepresentable>(enumValue: T?, key:String?) {
        let val = encodedEnumValue(enumValue)

        if key == nil {
            setValueForCurrentKey(val)
        } else {
            setValue(key!, value: val)
        }
    }

    func addEnumArray<T: RawRepresentable>(enumArray: Array<T>?, key: String?) {
        guard let array = enumArray else {
            if key == nil {
                setValueForCurrentKey(nil)
            } else {
                setValue(key!, value: nil)
            }

            return
        }

        var encoded:[NSCoding] = []

        for enumVal in array {
            if let val = encodedEnumValue(enumVal) {
                encoded.append(val)
            }
        }

        if key == nil {
            setValueForCurrentKey(encoded)
        } else {
            setValue(key!, value: encoded)
        }
    }

    func addEnumDictionary<T: RawRepresentable>(enumDict: [String: T]?, key: String?) {
        guard let dict = enumDict else {
            if key == nil {
                setValueForCurrentKey(nil)
            } else {
                setValue(key!, value: nil)
            }

            return
        }

        var encoded:[String: NSCoding] = [:]

        for (key, enumVal) in dict {
            if let val = encodedEnumValue(enumVal) {
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

extension Decoder: EnumEncoding {
    func decodedEnumValue<T: RawRepresentable>(val: AnyObject?) -> T? {
        guard val != nil else {
            return nil
        }

        let dt = T.RawValue.self

        if let x = val! as? NSNumber {
            if dt == Int.self {
                return T(rawValue: x.integerValue as! T.RawValue)
            } else if dt == Int8.self {
                return T(rawValue: x.charValue as! T.RawValue)
            } else if dt == Int16.self {
                return T(rawValue: x.shortValue as! T.RawValue)
            } else if dt == Int32.self {
                return T(rawValue: x.intValue as! T.RawValue)
            } else if dt == Int64.self {
                return T(rawValue: x.longLongValue as! T.RawValue)
            } else if dt == UInt.self {
                return T(rawValue: x.unsignedIntegerValue as! T.RawValue)
            } else if dt == UInt8.self {
                return T(rawValue: x.unsignedCharValue as! T.RawValue)
            } else if dt == UInt16.self {
                return T(rawValue: x.unsignedShortValue as! T.RawValue)
            } else if dt == UInt32.self {
                return T(rawValue: x.unsignedIntValue as! T.RawValue)
            } else if dt == UInt64.self {
                return T(rawValue: x.unsignedLongLongValue as! T.RawValue)
            } else if dt == Float.self {
                return T(rawValue: x.floatValue as! T.RawValue)
            } else if dt == Double.self {
                return T(rawValue: x.doubleValue as! T.RawValue)
            }
        } else if let x = val as? String {
            if dt == Character.self {
                return T(rawValue: Character(x) as! T.RawValue)

            } else {
                return T(rawValue: x as! T.RawValue)
            }
        }

        return nil
    }

    func enumValue<T: RawRepresentable>(key: String?) -> T? {
        let val = ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? NSCoding
        let decodedVal: T? = decodedEnumValue(val)
        return decodedVal
    }

    func enumArray<T: RawRepresentable>(key: String?) -> Array<T>? {
        let val = ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? Array<AnyObject>

        guard val != nil else {
            return nil
        }

        var decoded: [T] = []

        for ele in val! {
            if let decodedVal: T = decodedEnumValue(ele) {
                decoded.append(decodedVal)
            }
        }

        return decoded
    }

    func enumDictionary<T: RawRepresentable>(key: String?) -> [String : T]? {
        let val = ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? [String : AnyObject]

        guard val != nil else {
            return nil
        }

        var decoded: [String : T] = [:]

        for (key, ele) in val! {
            if let decodedVal: T = decodedEnumValue(ele) {
                decoded[key] = decodedVal
            }
        }
        
        return decoded
    }
}