//
//  BasicTypesExtension.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

protocol BasicTypesExension {}

// MARK: Integer values

func --> <T: SignedIntegerType>(left:T, right: Encoder) {
    right.addSignedInteger(left)
}

func --> <T: UnsignedIntegerType>(left:T, right: Encoder) {
    right.addUnsignedInteger(left)
}

func <-- <T: SignedIntegerType>(inout left:T, right: Decoder) {
    guard let rightValue = right.getSignedIntegerValue(left) else {
        return
    }

    left = rightValue
}

func <-- <T: UnsignedIntegerType>(inout left:T, right: Decoder) {
    guard let rightValue = right.getUnsignedIntegerValue(left) else {
        return
    }

    left = rightValue
}

// MARK: Optional integer values

func --> <T: SignedIntegerType>(left:T?, right: Encoder) {
    right.addSignedInteger(left)
}

func --> <T: UnsignedIntegerType>(left:T?, right: Encoder) {
    right.addUnsignedInteger(left)
}

func <-- <T: SignedIntegerType>(inout left:T?, right: Decoder) {
    guard let rightValue = right.getSignedIntegerValue(left) else {
        return
    }

    left = rightValue
}

func <-- <T: UnsignedIntegerType>(inout left:T?, right: Decoder) {
    guard let rightValue = right.getUnsignedIntegerValue(left) else {
        return
    }

    left = rightValue
}


extension Encoder : BasicTypesExension {
    // MARK: Integer types

    func addSignedInteger<T: SignedIntegerType>(int: T?) {
        if let x = int as? Int {
            setValueForCurrentKey(NSNumber(integer: x))
        } else if let x = int as? Int8 {
            setValueForCurrentKey(NSNumber(char: x))
        } else if let x = int as? Int16 {
            setValueForCurrentKey(NSNumber(short: x))
        } else if let x = int as? Int32 {
            setValueForCurrentKey(NSNumber(int: x))
        } else if let x = int as? Int64 {
            setValueForCurrentKey(NSNumber(longLong: x))
        } else {
            setValueForCurrentKey(nil)
        }
    }

    func addUnsignedInteger<T: UnsignedIntegerType>(uint: T?) {
        if let x = uint as? UInt {
            setValueForCurrentKey(NSNumber(unsignedInteger: x))
        } else if let x = uint as? UInt8 {
            setValueForCurrentKey(NSNumber(unsignedChar: x))
        } else if let x = uint as? UInt16 {
            setValueForCurrentKey(NSNumber(unsignedShort: x))
        } else if let x = uint as? UInt32 {
            setValueForCurrentKey(NSNumber(unsignedInt: x))
        } else if let x = uint as? UInt64 {
            setValueForCurrentKey(NSNumber(unsignedLongLong: x))
        } else {
            setValueForCurrentKey(nil)
        }
    }

    // MARK: Float and Double

    func addFloat(float: Float?) {
        if float != nil {
            setValueForCurrentKey(NSNumber(float: float!))
        } else {
            setValueForCurrentKey(nil)
        }
    }

    func addDouble(double: Double?) {
        if double != nil {
            setValueForCurrentKey(NSNumber(double: double!))
        } else {
            setValueForCurrentKey(nil)
        }
    }

    // MARK: Basic Types

    func addBool(bool: Bool?) {
        if bool != nil {
            setValueForCurrentKey(NSNumber(bool: bool!))
        } else {
            setValueForCurrentKey(nil)
        }
    }

    func addString(string: String?) {
        if string != nil {
            setValueForCurrentKey(string)
        } else {
            setValueForCurrentKey(nil)
        }
    }
}

extension Decoder : BasicTypesExension {
    // MARK: Integer types

    func getSignedIntegerValue<T: SignedIntegerType>(int: T?) -> T? {
        guard let val = valueForCurrentKey() as? NSNumber else {
            return nil
        }

        let dt = int.dynamicType

        if dt == Int.self || dt == Int?.self {
            return val.integerValue as? T
        } else if dt == Int8.self || dt == Int8?.self {
            return val.charValue as? T
        } else if dt == Int16.self || dt == Int16?.self {
            return val.shortValue as? T
        } else if dt == Int32.self || dt == Int32?.self {
            return val.intValue as? T
        } else if dt == Int64.self || dt == Int64?.self {
            return val.longLongValue as? T
        }

        return nil
    }

    func getUnsignedIntegerValue<T: UnsignedIntegerType>(uint: T?) -> T? {
        guard let val = valueForCurrentKey() as? NSNumber else {
            return nil
        }

        let dt = uint.dynamicType

        if dt == UInt.self || dt == UInt?.self {
            return val.unsignedIntegerValue as? T
        } else if dt == UInt8.self || dt == UInt8?.self {
            return val.unsignedCharValue as? T
        } else if dt == UInt16.self || dt == UInt16?.self {
            return val.unsignedShortValue as? T
        } else if dt == UInt32.self || dt == UInt32?.self {
            return val.unsignedIntValue as? T
        } else if dt == UInt64.self || dt == UInt64?.self {
            return val.unsignedLongLongValue as? T
        }
        
        return nil
    }

    // MARK: Float and Double types

    func getFloatValue() -> Float? {
        guard let val = valueForCurrentKey() as? NSNumber else {
            return nil
        }

        return val.floatValue
    }

    func getDoubleValue() -> Double? {
        guard let val = valueForCurrentKey() as? NSNumber else {
            return nil
        }

        return val.doubleValue
    }

    // MARK: Basic Types

    func getBoolValue() -> Bool? {
        guard let val = valueForCurrentKey() as? NSNumber else {
            return nil
        }

        return val.boolValue
    }

    func getStringValue() -> String? {
        guard let val = valueForCurrentKey() as? String else {
            return nil
        }

        return val
    }
}