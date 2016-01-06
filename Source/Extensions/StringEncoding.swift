//
//  BasicTypesExtension.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

protocol StringEncoding {}

// MARK: String

func --> (left:String, right: Encoder) {
    right.addString(left, key: nil)
}

func <-- (inout left:String, right: Decoder) {
    guard let rightValue = right.string(nil) else {
        return
    }

    left = rightValue
}

// MARK: String Optional

func --> (left:String?, right: Encoder) {
    right.addString(left, key: nil)
}

func <-- (inout left:String?, right: Decoder) {
    guard let rightValue = right.string(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: String arrays

func --> (left:Array<String>, right: Encoder) {
    right.addStringArray(left, key: nil)
}

func <-- (inout left:Array<String>, right: Decoder) {
    guard let rightValue = right.stringArray(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional String arrays

func --> (left:Array<String>?, right: Encoder) {
    right.addStringArray(left, key: nil)
}

func <-- (inout left:Array<String>?, right: Decoder) {
    guard let rightValue = right.stringArray(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: String dictionaries

func --> (left: [String: String], right: Encoder) {
    right.addStringDictionary(left, key: nil)
}

func <-- (inout left: [String: String], right: Decoder) {
    guard let rightValue: [String: String] = right.stringDictionary(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional Double dictionaries

func --> (left: [String: String]?, right: Encoder) {
    right.addStringDictionary(left, key: nil)
}

func <-- (inout left: [String: String]?, right: Decoder) {
    guard let rightValue: [String: String] = right.stringDictionary(nil) else {
        left = nil
        return
    }

    left = rightValue
}

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