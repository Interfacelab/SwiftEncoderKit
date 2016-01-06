//
//  EncodableExtension.swift
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

protocol EncodableEncoding {}

// MARK: Encoder

extension Encoder : EncodableEncoding {
    func addEncodable(encodable: Encodable?, key: String?) {
        guard let encodableObj = encodable else {
            if key == nil {
                setValueForCurrentKey(nil)
            } else {
                setValue(key!, value: nil)
            }

            return
        }

        let encoder = Encoder(encodableObj)

        if key == nil {
            setValueForCurrentKey(encoder.data)
        } else {
            setValue(key!, value: encoder.data)
        }
    }

    func addEncodableArray<T: Encodable>(arrayOfEncodable: Array<T>?, key: String?) {
        guard let array = arrayOfEncodable else {
            if key == nil {
                setValueForCurrentKey(nil)
            } else {
                setValue(key!, value: nil)
            }
            return
        }

        var encoded: [[String: NSCoding]] = []
        for ele in array {
            let encoder=Encoder(ele)
            encoded.append(encoder.data)
        }

        if key == nil {
            setValueForCurrentKey(encoded)
        } else {
            setValue(key!, value: encoded)
        }
    }


    func addEncodableDictionary<T: Encodable>(encodableDict: [String: T]?, key: String?) {
        guard let dict = encodableDict else {
            if key == nil {
                setValueForCurrentKey(nil)
            } else {
                setValue(key!, value: nil)
            }
            return
        }

        var encoded: [String: [String: NSCoding]] = [:]
        for (key, ele) in dict {
            let encoder=Encoder(ele)
            encoded[key] = encoder.data
        }

        if key == nil {
            setValueForCurrentKey(encoded)
        } else {
            setValue(key!, value: encoded)
        }
    }
}

// MARK: Decoder

extension Decoder : EncodableEncoding {
    func encodable<T: Encodable>(key: String?) -> T? {
        let val = ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? [String: AnyObject]
        guard val != nil else {
            return nil
        }

        let decoder=Decoder(dict: val!)
        return T(decoder)
    }

    func encodableArray<T: Encodable>(key: String?) -> Array<T>? {
        let val = ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as?
            Array<[String: AnyObject]>

        guard val != nil else {
            return nil
        }

        var decoded: [T] = []

        for ele in val! {
            let decoder=Decoder(dict: ele)
            decoded.append(T(decoder)!)
        }

        return decoded
    }

    func encodableDictionary<T: Encodable>(key: String?) -> [String: T]? {
        let val = ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as?
            [String: [String: AnyObject]]

        guard val != nil else {
            return nil
        }

        var decoded: [String: T] = [:]

        for (key, ele) in val! {
            let decoder=Decoder(dict: ele)
            decoded[key]=T(decoder)!
        }

        return decoded
    }
}