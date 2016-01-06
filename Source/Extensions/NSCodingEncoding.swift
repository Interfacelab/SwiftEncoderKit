//
//  NSCodingExtension.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

protocol NSCodingEncoding {}

// MARK: NSCoding

func --> <T: NSCoding>(left:T, right: Encoder) {
    right.addNSCoding(left, key: nil)
}

func <-- <T: NSCoding>(inout left:T, right: Decoder) {
    guard let rightValue: T = right.nsCoding(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional NSCoding

func --> <T: NSCoding>(left:T?, right: Encoder) {
    right.addNSCoding(left, key: nil)
}

func <-- <T: NSCoding>(inout left:T?, right: Decoder) {
    guard let rightValue: T = right.nsCoding(nil) else {
        return
    }

    left = rightValue
}


// MARK: NSCoding arrays

func --> <T: NSCoding>(left:Array<T>, right: Encoder) {
    right.addNSCodingArray(left, key: nil)
}

func <-- <T: NSCoding>(inout left:Array<T>, right: Decoder) {
    guard let rightValue: Array<T> = right.nsCodingArray(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional NSCoding arrays

func --> <T: NSCoding>(left:Array<T>?, right: Encoder) {
    right.addNSCodingArray(left, key: nil)
}

func <-- <T: NSCoding>(inout left:Array<T>?, right: Decoder) {
    guard let rightValue: Array<T> = right.nsCodingArray(nil) else {
        left = nil
        return
    }

    left = rightValue
}

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
}

// MARK: Decoder

extension Decoder : NSCodingEncoding {
    func nsCoding<T: NSCoding>(key: String?) -> T? {
        let val = ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? NSCoding
        guard val != nil else {
            return nil
        }

        return val as? T
    }

    func nsCodingArray<T: NSCoding>(key: String?) -> Array<T>? {
        let val = ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? Array<T>
        guard val != nil else {
            return nil
        }

        return val
    }
}