//
//  BasicTypesExtension.swift
//  SwiftEncoderKit
//
//  Created by Jon Gilkison on 1/2/16.
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

protocol BoolEncoding {}

// MARK: Encoder

extension Encoder : BoolEncoding {
    func addBool(bool: Bool?, key: String?) {
        if key == nil {
            setValueForCurrentKey(bool)
        } else {
            setValue(key!, value: bool)
        }
    }

    func addBoolArray(boolArray: Array<Bool>?, key: String?) {
        if key == nil {
            setValueForCurrentKey(boolArray)
        } else {
            setValue(key!, value: boolArray)
        }
    }

    func addBoolDictionary(boolDict: [String: Bool]?, key: String?) {
        if key == nil {
            setValueForCurrentKey(boolDict)
        } else {
            setValue(key!, value: boolDict)
        }
    }
}

// MARK: Decoder

extension Decoder : BoolEncoding {
    func bool(key: String?) -> Bool? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? Bool
    }

    func boolArray(key: String?) -> Array<Bool>? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? Array<Bool>
    }

    func boolDictionary(key: String?) -> [String: Bool]? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? [String: Bool]
    }
}