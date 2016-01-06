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

protocol StringEncoding {}

// MARK: Encoder

extension Encoder : StringEncoding {
    func addString(string: String?, key: String?) {
        if key == nil {
            setValueForCurrentKey(string)
        }
        else {
            setValue(key!, value: string)
        }
    }

    func addStringArray(stringArray: Array<String>?, key: String?) {
        if key == nil {
            setValueForCurrentKey(stringArray)
        }
        else {
            setValue(key!, value: stringArray)
        }
    }

    func addStringDictionary(stringDict: [String: String]?, key: String?) {
        if key == nil {
            setValueForCurrentKey(stringDict)
        } else {
            setValue(key!, value: stringDict)
        }
    }
}

// MARK: Decoder

extension Decoder : StringEncoding {
    func string(key: String?) -> String? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? String
    }

    func stringArray(key: String?) -> Array<String>? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? Array<String>
    }

    func stringDictionary(key: String?) -> [String: String]? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? [String: String]
    }
}