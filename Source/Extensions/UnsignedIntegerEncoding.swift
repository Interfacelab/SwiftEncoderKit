//
//  BasicTypesExtension.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

protocol UnsignedIntegerEncoding {}

// MARK: Integer values

func --> <T: UnsignedIntegerType>(left:T, right: Encoder) {
    right.addUnsignedInteger(left, key:nil)
}

func <-- <T: UnsignedIntegerType>(inout left:T, right: Decoder) {
    guard let rightValue: T = right.unsignedInteger(nil) else {
        return
    }

    left = rightValue
}

// MARK: Integer arrays

func --> <T: UnsignedIntegerType>(left:Array<T>, right: Encoder) {
    right.addUnsignedIntegerArray(left, key:nil)
}

func <-- <T: UnsignedIntegerType>(inout left:Array<T>, right: Decoder) {
    guard let rightValue:Array<T> = right.unsignedIntegerArray(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional integer values

func --> <T: UnsignedIntegerType>(left:T?, right: Encoder) {
    right.addUnsignedInteger(left, key:nil)
}

func <-- <T: UnsignedIntegerType>(inout left:T?, right: Decoder) {
    guard let rightValue: T = right.unsignedInteger(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Optional integer arrays

func --> <T: UnsignedIntegerType>(left:Array<T>?, right: Encoder) {
    right.addUnsignedIntegerArray(left, key:nil)
}

func <-- <T: UnsignedIntegerType>(inout left:Array<T>?, right: Decoder) {
    guard let rightValue:Array<T> = right.unsignedIntegerArray(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Integer dictionaries

func --> <T: UnsignedIntegerType>(left: [String: T], right: Encoder) {
    right.addUnsignedIntegerDictionary(left, key:nil)
}

func <-- <T: UnsignedIntegerType>(inout left: [String: T], right: Decoder) {
    guard let rightValue: [String: T] = right.unsignedIntegerDictionary(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional Integer dictionaries

func --> <T: UnsignedIntegerType>(left: [String: T]?, right: Encoder) {
    right.addUnsignedIntegerDictionary(left, key:nil)
}

func <-- <T: UnsignedIntegerType>(inout left: [String: T]?, right: Decoder) {
    guard let rightValue: [String: T] = right.unsignedIntegerDictionary(nil) else {
        left = nil
        return
    }

    left = rightValue
}

extension Encoder : UnsignedIntegerEncoding {
    // MARK: Integer utilities

    func encodedValueForUnsignedInteger<T: UnsignedIntegerType>(uint: T?) -> NSCoding? {
        guard let uintVal = uint else {
            return nil
        }

        if let x = uintVal as? UInt {
            return NSNumber(unsignedInteger: x)
        } else if let x = uintVal as? UInt8 {
            return NSNumber(unsignedChar: x)
        } else if let x = uintVal as? UInt16 {
            return NSNumber(unsignedShort: x)
        } else if let x = uintVal as? UInt32 {
            return NSNumber(unsignedInt: x)
        } else if let x = uintVal as? UInt64 {
            return NSNumber(unsignedLongLong: x)
        }

        return nil
    }

    // MARK: Integers

    func addUnsignedInteger<T: UnsignedIntegerType>(uint: T?, key: String?) {
        let val = encodedValueForUnsignedInteger(uint)

        if key == nil {
            setValueForCurrentKey(val)
        } else {
            setValue(key!, value: val)
        }
    }

    // MARK: Arrays

    func addUnsignedIntegerArray<T: UnsignedIntegerType>(uintegerArray: Array<T>?, key: String?) {
        guard let array = uintegerArray else {
            if key == nil {
                setValueForCurrentKey(nil)
            } else {
                setValue(key!, value: nil)
            }

            return
        }

        var encoded:[NSCoding] = []

        for uint in array {
            if let val = encodedValueForUnsignedInteger(uint) {
                encoded.append(val)
            }
        }

        if key == nil {
            setValueForCurrentKey(encoded)
        } else {
            setValue(key!, value: encoded)
        }
    }

    // MARK: Dictionaries

    func addUnsignedIntegerDictionary<T: UnsignedIntegerType>(uintegerDict: [String: T]?, key: String?) {
        guard let dict = uintegerDict else {
            if key == nil {
                setValueForCurrentKey(nil)
            } else {
                setValue(key!, value: nil)
            }

            return
        }

        var encoded:[String: NSCoding] = [:]

        for (key, uint) in dict {
            if let val = encodedValueForUnsignedInteger(uint) {
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

extension Decoder : UnsignedIntegerEncoding {
    func decodedUnsignedIntegerForValue<T: UnsignedIntegerType>(val: NSCoding?) -> T? {
        guard let uintVal = val as? NSNumber else {
            return nil
        }

        let dt = T.self

        if dt == UInt.self || dt == UInt?.self {
            return uintVal.unsignedIntegerValue as? T
        } else if dt == UInt8.self || dt == UInt8?.self {
            return uintVal.unsignedCharValue as? T
        } else if dt == UInt16.self || dt == UInt16?.self {
            return uintVal.unsignedShortValue as? T
        } else if dt == UInt32.self || dt == UInt32?.self {
            return uintVal.unsignedIntValue as? T
        } else if dt == UInt64.self || dt == UInt64?.self {
            return uintVal.unsignedLongLongValue as? T
        }

        return nil
    }

    func unsignedInteger<T: UnsignedIntegerType>(key: String?) -> T? {
        let val = ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? NSCoding
        let decodedVal: T? = decodedUnsignedIntegerForValue(val)
        return decodedVal
    }

    func unsignedIntegerArray<T: UnsignedIntegerType>(key: String?) -> Array<T>? {
        let val = ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? Array<NSNumber>

        guard val != nil else {
            return nil
        }

        var decoded: [T] = []

        for ele in val! {
            if let decodedVal: T = decodedUnsignedIntegerForValue(ele) {
                decoded.append(decodedVal)
            }
        }

        return decoded
    }

    func unsignedIntegerDictionary<T: UnsignedIntegerType>(key: String?) -> [String : T]? {
        let val = ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? [String : NSNumber]

        guard val != nil else {
            return nil
        }

        var decoded: [String : T] = [:]

        for (key, ele) in val! {
            if let decodedVal: T = decodedUnsignedIntegerForValue(ele) {
                decoded[key] = decodedVal
            }
        }

        return decoded
    }
}