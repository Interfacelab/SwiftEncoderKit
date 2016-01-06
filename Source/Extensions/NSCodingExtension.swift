//
//  NSCodingExtension.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

protocol NSCodingExtension {}

// MARK: NSCoding

func --> <T: NSCoding>(left:T, right: Encoder) {
    right.addNSCoding(left)
}

func <-- <T: NSCoding>(inout left:T, right: Decoder) {
    guard let rightValue: T = right.nsCoding(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional NSCoding

func --> <T: NSCoding>(left:T?, right: Encoder) {
    right.addNSCoding(left)
}

func <-- <T: NSCoding>(inout left:T?, right: Decoder) {
    guard let rightValue: T = right.nsCoding(nil) else {
        return
    }

    left = rightValue
}


// MARK: NSCoding arrays

func --> <T: NSCoding>(left:Array<T>, right: Encoder) {
    right.addNSCodingArray(left)
}

func <-- <T: NSCoding>(inout left:Array<T>, right: Decoder) {
    guard let rightValue: Array<T> = right.nsCodingArray(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional NSCoding arrays

func --> <T: NSCoding>(left:Array<T>?, right: Encoder) {
    right.addNSCodingArray(left)
}

func <-- <T: NSCoding>(inout left:Array<T>?, right: Decoder) {
    guard let rightValue: Array<T> = right.nsCodingArray(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Encoder

extension Encoder : NSCodingExtension {
    func addNSCoding(object: NSCoding?) {
        setValueForCurrentKey(object)
    }

    func addNSCodingArray(nsCodingArray: Array<NSCoding>?) {
        setValueForCurrentKey(nsCodingArray)
    }
}

// MARK: Decoder

extension Decoder : NSCodingExtension {
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