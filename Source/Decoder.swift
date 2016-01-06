//
//  Decoder.swift
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

infix operator <-- { }

class Decoder {
    private var _currentKey: String?
    private let _data: [String: AnyObject]

    init(path: String) {
        if let root = NSKeyedUnarchiver.unarchiveObjectWithFile(path) {
            _data = root as! [String: AnyObject]
        } else {
            _data = [:]
        }
    }

    init(dict: [String: AnyObject]) {
        _data = dict
    }

    subscript(key: String) -> Decoder {
        _currentKey = key
        return self
    }

    func valueForCurrentKey() -> AnyObject? {
        guard let key = _currentKey, let val = _data[key] else {
            return nil
        }

        return val
    }

    func valueForKey(key: String) -> AnyObject? {
        guard let val = _data[key] else {
            return nil
        }

        return val
    }

    func decodedObject<T: Encodable>() -> T? {
        return T(self)
    }
}