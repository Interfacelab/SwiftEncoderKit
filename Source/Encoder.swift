//
//  Encoder.swift
//  SwiftEncoderKit
//
//  Created by Jon Gilkison on 1/1/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

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