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
    right.addString(left)
}

func <-- (inout left:String, right: Decoder) {
    guard let rightValue = right.string(nil) else {
        return
    }

    left = rightValue
}

// MARK: String Optional

func --> (left:String?, right: Encoder) {
    right.addString(left)
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
    right.addStringArray(left)
}

func <-- (inout left:Array<String>, right: Decoder) {
    guard let rightValue = right.stringArray(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional String arrays

func --> (left:Array<String>?, right: Encoder) {
    right.addStringArray(left)
}

func <-- (inout left:Array<String>?, right: Decoder) {
    guard let rightValue = right.stringArray(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Encoder

extension Encoder : StringEncoding {
    func addString(string: String?) {
        setValueForCurrentKey(string)
    }

    func addStringArray(stringArray: Array<String>?) {
        setValueForCurrentKey(stringArray)
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
}