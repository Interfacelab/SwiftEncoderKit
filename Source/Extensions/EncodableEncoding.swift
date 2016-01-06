//
//  EncodableExtension.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

protocol EncodableEncoding {}

// MARK: Encodable values

func --> <T: Encodable>(left:T, right: Encoder) {
    right.addEncodable(left, key: nil)
}

func <-- <T: Encodable>(inout left:T, right: Decoder) {
    guard let rightValue: T = right.encodable(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional Encodable values

func --> <T: Encodable>(left:T?, right: Encoder) {
    right.addEncodable(left, key: nil)
}

func <-- <T: Encodable>(inout left:T?, right: Decoder) {
    guard let rightValue: T = right.encodable(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Encodable arrays

func --> <T: Encodable>(left:Array<T>, right: Encoder) {
    right.addEncodableArray(left, key: nil)
}

func <-- <T: Encodable>(inout left:Array<T>, right: Decoder) {
    guard let rightValue:Array<T> = right.encodableArray(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional encodable arrays

func --> <T: Encodable>(left:Array<T>?, right: Encoder) {
    right.addEncodableArray(left, key: nil)
}

func <-- <T: Encodable>(inout left:Array<T>?, right: Decoder) {
    guard let rightValue:Array<T> = right.encodableArray(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Encodable dictionaries

func --> <T: Encodable>(left: [String: T], right: Encoder) {
    right.addEncodableDictionary(left, key: nil)
}

func <-- <T: Encodable>(inout left: [String: T], right: Decoder) {
    guard let rightValue: [String: T] = right.encodableDictionary(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional Encodable dictionaries

func --> <T: Encodable>(left: [String: T]?, right: Encoder) {
    right.addEncodableDictionary(left, key: nil)
}

func <-- <T: Encodable>(inout left: [String: T]?, right: Decoder) {
    guard let rightValue: [String: T] = right.encodableDictionary(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Encoder

extension Encoder : EncodableEncoding {
    func addEncodable(encodable: Encodable?, key: String?) {
        guard let encodableObj = encodable else {
            if key == nil {
                setValueForCurrentKey(nil)
            }
            else {
                setValue(key!, value: nil)
            }

            return
        }

        let encoder = Encoder()
        encodableObj.encode(encoder)

        if key == nil {
            setValueForCurrentKey(encoder.data)
        }
        else {
            setValue(key!, value: encoder.data)
        }
    }

    func addEncodableArray<T: Encodable>(arrayOfEncodable: Array<T>?, key: String?) {
        guard let array = arrayOfEncodable else {
            if key == nil {
                setValueForCurrentKey(nil)
            }
            else {
                setValue(key!, value: nil)
            }
            return
        }

        var encoded: [[String: NSCoding]] = []
        for ele in array {
            let encoder=Encoder()
            ele.encode(encoder)
            encoded.append(encoder.data)
        }

        if key == nil {
            setValueForCurrentKey(encoded)
        }
        else {
            setValue(key!, value: encoded)
        }
    }


    func addEncodableDictionary<T: Encodable>(encodableDict: [String: T]?, key: String?) {
        guard let dict = encodableDict else {
            if key == nil {
                setValueForCurrentKey(nil)
            }
            else {
                setValue(key!, value: nil)
            }
            return
        }

        var encoded: [String: [String: NSCoding]] = [:]
        for (key, ele) in dict {
            let encoder=Encoder()
            ele.encode(encoder)
            encoded[key] = encoder.data
        }

        if key == nil {
            setValueForCurrentKey(encoded)
        }
        else {
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