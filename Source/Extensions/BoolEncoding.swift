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

// MARK: Bool dictionaries

func --> (left: [String: Bool], right: Encoder) {
    right.addBoolDictionary(left, key: nil)
}

func <-- (inout left: [String: Bool], right: Decoder) {
    guard let rightValue: [String: Bool] = right.boolDictionary(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional Bool dictionaries

func --> (left: [String: Bool]?, right: Encoder) {
    right.addBoolDictionary(left, key: nil)
}

func <-- (inout left: [String: Bool]?, right: Decoder) {
    guard let rightValue: [String: Bool] = right.boolDictionary(nil) else {
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