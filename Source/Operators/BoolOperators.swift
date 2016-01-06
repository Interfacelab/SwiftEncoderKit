//
//  BasicTypesExtension.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

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