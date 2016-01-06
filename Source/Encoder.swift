//
//  Encoder.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/1/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

class Encoder {
    private var currentKey: String?
    private var data:[String: NSCoding]=[:]

    var jsonString:String? {
        get {
            let jsonData = try! NSJSONSerialization.dataWithJSONObject(data, options: .PrettyPrinted)
            return String(data: jsonData, encoding: NSUTF8StringEncoding)
        }
    }

    init() {
    }

    func writeToFile(path: String) {
        let archivedData = NSKeyedArchiver.archivedDataWithRootObject(data)
        archivedData.writeToFile(path, atomically: true)
    }

    subscript(key: String) -> Encoder {
        currentKey = key
        return self
    }

    func addEncodable(encodable: Encodable) {
        guard let key = currentKey else {
            return
        }

        let encoder = Encoder()
        encodable.encode(encoder)

        data[key] = encoder.data
    }

    func addSignedInteger<T: SignedIntegerType>(int: T?) {
        guard let key = currentKey else {
            return
        }

        if let x = int as? Int {
            data[key] = NSNumber(integer: x)
        } else if let x = int as? Int8 {
            data[key] = NSNumber(char: x)
        } else if let x = int as? Int16 {
            data[key] = NSNumber(short: x)
        } else if let x = int as? Int32 {
            data[key] = NSNumber(int: x)
        } else if let x = int as? Int64 {
            data[key] = NSNumber(longLong: x)
        }
    }

    func addUnsignedInteger<T: UnsignedIntegerType>(uint: T?) {
        guard let key = currentKey else {
            return
        }

        if let x = uint as? UInt {
            data[key] = NSNumber(unsignedInteger: x)
        } else if let x = uint as? UInt8 {
            data[key] = NSNumber(unsignedChar: x)
        } else if let x = uint as? UInt16 {
            data[key] = NSNumber(unsignedShort: x)
        } else if let x = uint as? UInt32 {
            data[key] = NSNumber(unsignedInt: x)
        } else if let x = uint as? UInt64 {
            data[key] = NSNumber(unsignedLongLong: x)
        }
    }
}