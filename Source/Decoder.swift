//
//  Decoder.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/1/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

class Decoder {
    private var currentKey: String?
    private var data:[String: AnyObject]=[:]

    init(path: String) {
        if let root = NSKeyedUnarchiver.unarchiveObjectWithFile(path) {
            data = root as! [String: AnyObject]
            print(data)
        }
    }

    subscript(key: String) -> Decoder {
        currentKey = key
        return self
    }

    func getSignedIntegerValue<T: SignedIntegerType>(int: T?) -> T? {
        guard let key = currentKey, let val = data[key] as? NSNumber else {
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
        guard let key = currentKey, let val = data[key] as? NSNumber else {
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
}