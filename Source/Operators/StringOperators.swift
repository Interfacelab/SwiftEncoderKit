//
//  BasicTypesExtension.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

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

// MARK: Optional String dictionaries

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