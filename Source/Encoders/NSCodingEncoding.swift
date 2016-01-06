//
//  NSCodingExtension.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

protocol NSCodingEncoding {}

// MARK: Encoder

extension Encoder : NSCodingEncoding {
    func addNSCoding(object: NSCoding?, key: String?) {
        if key == nil {
            setValueForCurrentKey(object)
        }
        else {
            setValue(key!, value: object)
        }
    }

    func addNSCodingArray(objectArray: Array<NSCoding>?, key: String?) {
        if key == nil {
            setValueForCurrentKey(objectArray)
        }
        else {
            setValue(key!, value: objectArray)
        }
    }

    func addNSCodingDictionary<T: NSCoding>(objectDict: [String: T]?, key: String?) {
        if key == nil {
            setValueForCurrentKey(objectDict)
        } else {
            setValue(key!, value: objectDict)
        }
    }
}

// MARK: Decoder

extension Decoder : NSCodingEncoding {
    func nsCoding<T: NSCoding>(key: String?) -> T? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? T
    }

    func nsCodingArray<T: NSCoding>(key: String?) -> Array<T>? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? Array<T>
    }

    func nsCodingDictionary<T: NSCoding>(key: String?) -> [String: T]? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? [String: T]
    }
}