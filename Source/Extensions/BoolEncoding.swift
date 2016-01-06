//
//  BasicTypesExtension.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

protocol BoolEncoding {}

// MARK: Bool

func --> (left:Bool, right: Encoder) {
    right.addBool(left, key: nil)
}

func <-- (inout left:Bool, right: Decoder) {
    guard let rightValue = right.bool(nil) else {
        return
    }

    left = rightValue
}

// MARK: Bool Optional

func --> (left:Bool?, right: Encoder) {
    right.addBool(left, key: nil)
}

func <-- (inout left:Bool?, right: Decoder) {
    guard let rightValue = right.bool(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Bool arrays

func --> (left:Array<Bool>, right: Encoder) {
    right.addBoolArray(left, key: nil)
}

func <-- (inout left:Array<Bool>, right: Decoder) {
    guard let rightValue = right.boolArray(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional bool arrays

func --> (left:Array<Bool>?, right: Encoder) {
    right.addBoolArray(left, key: nil)
}

func <-- (inout left:Array<Bool>?, right: Decoder) {
    guard let rightValue = right.boolArray(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Encoder

extension Encoder : BoolEncoding {
    func addBool(bool: Bool?, key: String?) {
        if key == nil {
            setValueForCurrentKey(bool)
        }
        else {
            setValue(key!, value: bool)
        }
    }

    func addBoolArray(boolArray: Array<Bool>?, key: String?) {
        if key == nil {
            setValueForCurrentKey(boolArray)
        }
        else {
            setValue(key!, value: boolArray)
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
}