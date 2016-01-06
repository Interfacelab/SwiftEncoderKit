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
    right.addUnsignedInteger(left)
}

func <-- <T: UnsignedIntegerType>(inout left:T, right: Decoder) {
    guard let rightValue: T = right.unsignedInteger(nil) else {
        return
    }

    left = rightValue
}

// MARK: Integer arrays

func --> <T: UnsignedIntegerType>(left:Array<T>, right: Encoder) {
    right.addUnsignedIntegerArray(left)
}

func <-- <T: UnsignedIntegerType>(inout left:Array<T>, right: Decoder) {
    guard let rightValue:Array<T> = right.unsignedIntegerArray(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional integer values

func --> <T: UnsignedIntegerType>(left:T?, right: Encoder) {
    right.addUnsignedInteger(left)
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
    right.addUnsignedIntegerArray(left)
}

func <-- <T: UnsignedIntegerType>(inout left:Array<T>?, right: Decoder) {
    guard let rightValue:Array<T> = right.unsignedIntegerArray(nil) else {
        left = nil
        return
    }

    left = rightValue
}


extension Encoder : UnsignedIntegerEncoding {

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

    func addUnsignedIntegerArray<T: UnsignedIntegerType>(uintegerArray: Array<T>?) {
        guard let array = uintegerArray else {
            setValueForCurrentKey(nil)
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

        setValueForCurrentKey(encoded)
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
}