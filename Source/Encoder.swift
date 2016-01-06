//
//  Encoder.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/1/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

infix operator --> {}

class Encoder {
    private var _currentKey: String?
    private var _data:[String: NSCoding]=[:]

    /// The current encoder key
    var currentKey: String? {
        get {
            return _currentKey
        }
    }

    /// The currently encoded data
    var data: [String: NSCoding] {
        get {
            return _data
        }
    }

    init(_ object: Encodable) {
        object.encode(self)
    }

    subscript(key: String) -> Encoder {
        _currentKey = key
        return self
    }

    /**
     Sets the value for a given key on the encoder

     - parameter key:   The key for the value
     - parameter value:	The value to set
     */
    func setValue(key: String, value: NSCoding?) {
        _data[key] = value ?? NSNull()
    }

    /**
     Sets the value for the current key

     - parameter value:	The value to set
     */
    func setValueForCurrentKey(value: NSCoding?) {
        guard let key = _currentKey else {
            return
        }

        _data[key] = value ?? NSNull()
    }

    /**
    Writes the contents of the encoder to a binary plist file

    - parameter path:	The file path to write to
    */
    func writeToFile(path: String) {
        let archivedData = NSKeyedArchiver.archivedDataWithRootObject(_data)
        archivedData.writeToFile(path, atomically: true)
    }

}