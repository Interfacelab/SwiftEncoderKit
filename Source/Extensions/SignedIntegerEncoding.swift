//
//  BasicTypesExtension.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

protocol SignedIntegerEncoding {}

// MARK: Integer values

func --> <T: SignedIntegerType>(left:T, right: Encoder) {
    right.addSignedInteger(left)
}

func <-- <T: SignedIntegerType>(inout left:T, right: Decoder) {
    guard let rightValue = right.getSignedIntegerValue(left) else {
        return
    }

    left = rightValue
}


// MARK: Integer arrays

func --> <T: SignedIntegerType>(left:Array<T>, right: Encoder) {
    right.addSignedIntegerArray(left)
}

func <-- <T: SignedIntegerType>(inout left:Array<T>, right: Decoder) {
    guard let rightValue:Array<T> = right.getSignedIntegerArray() else {
        return
    }

    left = rightValue
}

// MARK: Optional integer values

func --> <T: SignedIntegerType>(left:T?, right: Encoder) {
    right.addSignedInteger(left)
}

func <-- <T: SignedIntegerType>(inout left:T?, right: Decoder) {
    guard let rightValue = right.getSignedIntegerValue(left) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Optional integer arrays

func --> <T: SignedIntegerType>(left:Array<T>?, right: Encoder) {
    right.addSignedIntegerArray(left)
}

func <-- <T: SignedIntegerType>(inout left:Array<T>?, right: Decoder) {
    guard let rightValue:Array<T> = right.getSignedIntegerArray() else {
        left = nil
        return
    }

    left = rightValue
}


extension Encoder : SignedIntegerEncoding {
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

    func addSignedIntegerArray<T: SignedIntegerType>(integerArray: Array<T>?) {
        guard let array = integerArray else {
            setValueForCurrentKey(nil)
            return
        }

        var encoded:[NSNumber] = []

        for int in array {
            if let x = int as? Int {
                encoded.append(NSNumber(integer: x))
            } else if let x = int as? Int8 {
                encoded.append(NSNumber(char: x))
            } else if let x = int as? Int16 {
                encoded.append(NSNumber(short: x))
            } else if let x = int as? Int32 {
                encoded.append(NSNumber(int: x))
            } else if let x = int as? Int64 {
                encoded.append(NSNumber(longLong: x))
            }
        }

        setValueForCurrentKey(encoded)
    }
}

extension Decoder : SignedIntegerEncoding {
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

    func getSignedIntegerArray<T: SignedIntegerType>() -> Array<T>? {
        guard let val = valueForCurrentKey() as? Array<NSNumber> else {
            return nil
        }

        let tt=T(0)
        let dt=tt.dynamicType

        var decoded: [T] = []

        for ele in val {
            if dt == Int.self || dt == Int?.self {
                decoded.append(ele.integerValue as! T)
            } else if dt == Int8.self || dt == Int8?.self {
                decoded.append(ele.charValue as! T)
            } else if dt == Int16.self || dt == Int16?.self {
                decoded.append(ele.shortValue as! T)
            } else if dt == Int32.self || dt == Int32?.self {
                decoded.append(ele.intValue as! T)
            } else if dt == Int64.self || dt == Int64?.self {
                decoded.append(ele.longLongValue as! T)
            }
        }

        return decoded
    }
}