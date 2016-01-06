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
        return
    }

    left = rightValue
}


extension Encoder : EnumEncoding {
    func encodedEnumValue<T: RawRepresentable>(enumValue: T?) -> NSCoding? {
        var val: NSCoding? = nil

        if let x = enumValue!.rawValue as? Int {
            val = NSNumber(integer: x)
        } else if let x = enumValue!.rawValue as? Int8 {
            val = NSNumber(char: x)
        } else if let x = enumValue!.rawValue as? Int16 {
            val = NSNumber(short: x)
        } else if let x = enumValue!.rawValue as? Int32 {
            val = NSNumber(int: x)
        } else if let x = enumValue!.rawValue as? Int64 {
            val = NSNumber(longLong: x)
        } else if let x = enumValue!.rawValue as? UInt {
            val = NSNumber(unsignedInteger: x)
        } else if let x = enumValue!.rawValue as? UInt8 {
            val = NSNumber(unsignedChar: x)
        } else if let x = enumValue!.rawValue as? UInt16 {
            val = NSNumber(unsignedShort: x)
        } else if let x = enumValue!.rawValue as? UInt32 {
            val = NSNumber(unsignedInt: x)
        } else if let x = enumValue!.rawValue as? UInt64 {
            val = NSNumber(unsignedLongLong: x)
        } else if let x = enumValue!.rawValue as? Float {
            val = x
        } else if let x = enumValue!.rawValue as? Double {
            val = x
        } else if let x = enumValue!.rawValue as? String {
            val = x
        } else if let x = enumValue!.rawValue as? Character {
            val = String(x)
        }

        return val
    }

    func addEnum<T: RawRepresentable>(enumValue: T?, key:String?) {
        let val = encodedEnumValue(enumValue)

        if key == nil {
            setValueForCurrentKey(val)
        } else {
            setValue(key!, value: val)
        }
    }
}

extension Decoder: EnumEncoding {
    func decodedEnumValue<T: RawRepresentable>(val: AnyObject?) -> T? {
        guard let enumVal = val else {
            return nil
        }

        let dt = T.RawValue.self

        if let x = enumVal as? NSNumber {
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
        } else if let x = enumVal as? String {
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
}