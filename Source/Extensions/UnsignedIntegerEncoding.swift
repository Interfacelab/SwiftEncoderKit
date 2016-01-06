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

    func addUnsignedInteger<T: UnsignedIntegerType>(uint: T?, key: String?) {
        var val: NSNumber? = nil

        if let x = uint as? UInt {
            val = NSNumber(unsignedInteger: x)
        } else if let x = uint as? UInt8 {
            val = NSNumber(unsignedChar: x)
        } else if let x = uint as? UInt16 {
            val = NSNumber(unsignedShort: x)
        } else if let x = uint as? UInt32 {
            val = NSNumber(unsignedInt: x)
        } else if let x = uint as? UInt64 {
            val = NSNumber(unsignedLongLong: x)
        }

        if key == nil {
            setValueForCurrentKey(val)
        } else {
            setValue(key!, value: val)
        }
    }

    func addUnsignedIntegerArray<T: UnsignedIntegerType>(uintegerArray: Array<T>?, key: String?) {
        guard let array = uintegerArray else {
            if key == nil {
                setValueForCurrentKey(nil)
            } else {
                setValue(key!, value: nil)
            }

            return
        }

        var encoded:[NSNumber] = []

        for uint in array {
            if let x = uint as? UInt {
                encoded.append(NSNumber(unsignedInteger: x))
            } else if let x = uint as? UInt8 {
                encoded.append(NSNumber(unsignedChar: x))
            } else if let x = uint as? UInt16 {
                encoded.append(NSNumber(unsignedShort: x))
            } else if let x = uint as? UInt32 {
                encoded.append(NSNumber(unsignedInt: x))
            } else if let x = uint as? UInt64 {
                encoded.append(NSNumber(unsignedLongLong: x))
            }
        }

        if key == nil {
            setValueForCurrentKey(encoded)
        } else {
            setValue(key!, value: encoded)
        }
    }

    func addUnsignedIntegerDictionary<T: UnsignedIntegerType>(uintegerDict: [String: T]?, key: String?) {
        guard let dict = uintegerDict else {
            if key == nil {
                setValueForCurrentKey(nil)
            } else {
                setValue(key!, value: nil)
            }

            return
        }

        var encoded:[String: NSNumber] = [:]

        for (key, uint) in dict {
            if let x = uint as? UInt {
                encoded[key] = NSNumber(unsignedInteger: x)
            } else if let x = uint as? UInt8 {
                encoded[key] = NSNumber(unsignedChar: x)
            } else if let x = uint as? UInt16 {
                encoded[key] = NSNumber(unsignedShort: x)
            } else if let x = uint as? UInt32 {
                encoded[key] = NSNumber(unsignedInt: x)
            } else if let x = uint as? UInt64 {
                encoded[key] = NSNumber(unsignedLongLong: x)
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
    func unsignedInteger<T: UnsignedIntegerType>(key: String?) -> T? {
        let val = ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? NSNumber

        guard val != nil else {
            return nil
        }

        let dt=T.self

        if dt == UInt.self || dt == UInt?.self {
            return val!.unsignedIntegerValue as? T
        } else if dt == UInt8.self || dt == UInt8?.self {
            return val!.unsignedCharValue as? T
        } else if dt == UInt16.self || dt == UInt16?.self {
            return val!.unsignedShortValue as? T
        } else if dt == UInt32.self || dt == UInt32?.self {
            return val!.unsignedIntValue as? T
        } else if dt == UInt64.self || dt == UInt64?.self {
            return val!.unsignedLongLongValue as? T
        }

        return nil
    }

    func unsignedIntegerArray<T: UnsignedIntegerType>(key: String?) -> Array<T>? {
        let val = ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? Array<NSNumber>

        guard val != nil else {
            return nil
        }

        let dt=T.self

        var decoded: [T] = []

        for ele in val! {
            if dt == UInt.self || dt == UInt?.self {
                decoded.append(ele.unsignedIntegerValue as! T)
            } else if dt == UInt8.self || dt == UInt8?.self {
                decoded.append(ele.unsignedCharValue as! T)
            } else if dt == UInt16.self || dt == UInt16?.self {
                decoded.append(ele.unsignedShortValue as! T)
            } else if dt == UInt32.self || dt == UInt32?.self {
                decoded.append(ele.unsignedIntValue as! T)
            } else if dt == UInt64.self || dt == UInt64?.self {
                decoded.append(ele.unsignedLongLongValue as! T)
            }
        }

        return decoded
    }

    func unsignedIntegerDictionary<T: UnsignedIntegerType>(key: String?) -> [String : T]? {
        let val = ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? [String : NSNumber]

        guard val != nil else {
            return nil
        }

        let dt=T.self

        var decoded: [String : T] = [:]

        for (key, ele) in val! {
            if dt == UInt.self || dt == UInt?.self {
                decoded[key] = ele.unsignedIntegerValue as? T
            } else if dt == UInt8.self || dt == UInt8?.self {
                decoded[key] = ele.unsignedCharValue as? T
            } else if dt == UInt16.self || dt == UInt16?.self {
                decoded[key] = ele.unsignedShortValue as? T
            } else if dt == UInt32.self || dt == UInt32?.self {
                decoded[key] = ele.unsignedIntValue as? T
            } else if dt == UInt64.self || dt == UInt64?.self {
                decoded[key] = ele.unsignedLongLongValue as? T
            }
        }
        
        return decoded
    }
}