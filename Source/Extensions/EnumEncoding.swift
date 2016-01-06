//
//  EnumEncoding.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/5/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

protocol EnumEncoding {}

// MARK: Enum

func --> <T:RawRepresentable>(left:T, right: Encoder) {
    right.addEnum(left, key: nil)
}

func <-- <T:RawRepresentable>(inout left:T, right: Decoder) {
    guard let rightValue: T = right.enumValue(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional Enum

func --> <T:RawRepresentable>(left:T?, right: Encoder) {
    right.addEnum(left, key: nil)
}

func <-- <T:RawRepresentable>(inout left:T?, right: Decoder) {
    guard let rightValue: T = right.enumValue(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: enum arrays

func --> <T: RawRepresentable>(left:Array<T>, right: Encoder) {
    right.addEnumArray(left, key:nil)
}

func <-- <T: RawRepresentable>(inout left:Array<T>, right: Decoder) {
    guard let rightValue:Array<T> = right.enumArray(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional enum arrays

func --> <T: RawRepresentable>(left:Array<T>?, right: Encoder) {
    right.addEnumArray(left, key:nil)
}

func <-- <T: RawRepresentable>(inout left:Array<T>?, right: Decoder) {
    guard let rightValue:Array<T> = right.enumArray(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Enum dictionaries

func --> <T: RawRepresentable>(left: [String: T], right: Encoder) {
    right.addEnumDictionary(left, key: nil)
}

func <-- <T: RawRepresentable>(inout left: [String: T], right: Decoder) {
    guard let rightValue: [String: T] = right.enumDictionary(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional Enum dictionaries

func --> <T: RawRepresentable>(left: [String: T]?, right: Encoder) {
    right.addEnumDictionary(left, key: nil)
}

func <-- <T: RawRepresentable>(inout left: [String: T]?, right: Decoder) {
    guard let rightValue: [String: T] = right.enumDictionary(nil) else {
        left = nil
        return
    }

    left = rightValue
}


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

    func addEnum<T: RawRepresentable>(enumValue: T?, key:String?) {
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