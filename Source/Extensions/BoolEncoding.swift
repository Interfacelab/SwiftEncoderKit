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
    right.addBool(left)
}

func <-- (inout left:Bool, right: Decoder) {
    guard let rightValue = right.bool() else {
        return
    }

    left = rightValue
}

// MARK: Bool Optional

func --> (left:Bool?, right: Encoder) {
    right.addBool(left)
}

func <-- (inout left:Bool?, right: Decoder) {
    guard let rightValue = right.bool() else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Bool arrays

func --> (left:Array<Bool>, right: Encoder) {
    right.addBoolArray(left)
}

func <-- (inout left:Array<Bool>, right: Decoder) {
    guard let rightValue = right.boolArray() else {
        return
    }

    left = rightValue
}

// MARK: Optional bool arrays

func --> (left:Array<Bool>?, right: Encoder) {
    right.addBoolArray(left)
}

func <-- (inout left:Array<Bool>?, right: Decoder) {
    guard let rightValue = right.boolArray() else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Encoder

extension Encoder : BoolEncoding {
    func addBool(bool: Bool?) {
        if bool != nil {
            setValueForCurrentKey(NSNumber(bool: bool!))
        } else {
            setValueForCurrentKey(nil)
        }
    }

    func addBoolArray(doubleArray: Array<Bool>?) {
        guard let array = doubleArray else {
            setValueForCurrentKey(nil)
            return
        }

        setValueForCurrentKey(array)
    }
}

// MARK: Decoder

extension Decoder : BoolEncoding {
    func bool() -> Bool? {
        guard let val = valueForCurrentKey() as? NSNumber else {
            return nil
        }

        return val.boolValue
    }

    func boolArray() -> Array<Bool>? {
        guard let val = valueForCurrentKey() as? Array<Bool> else {
            return nil
        }


        return val
    }

    func bool(key: String) -> Bool? {
        guard let val = valueForKey(key) as? NSNumber else {
            return nil
        }

        return val.boolValue
    }

    func boolArray(key: String) -> Array<Bool>? {
        guard let val = valueForKey(key) as? Array<Bool> else {
            return nil
        }


        return val
    }
}