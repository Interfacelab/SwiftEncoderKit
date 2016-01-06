//
//  BasicTypesExtension.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation
import QuartzCore

// MARK: Float

func --> (left:Float, right: Encoder) {
    right.addFloat(left, key: nil)
}

func <-- (inout left:Float, right: Decoder) {
    guard let rightValue = right.float(nil) else {
        return
    }

    left = rightValue
}

// MARK: Float Optional

func --> (left:Float?, right: Encoder) {
    right.addFloat(left, key: nil)
}

func <-- (inout left:Float?, right: Decoder) {
    guard let rightValue = right.float(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Float arrays

func --> (left:Array<Float>, right: Encoder) {
    right.addFloatArray(left, key: nil)
}

func <-- (inout left:Array<Float>, right: Decoder) {
    guard let rightValue = right.floatArray(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional float arrays

func --> (left:Array<Float>?, right: Encoder) {
    right.addFloatArray(left, key: nil)
}

func <-- (inout left:Array<Float>?, right: Decoder) {
    guard let rightValue = right.floatArray(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Float dictionaries

func --> (left: [String: Float], right: Encoder) {
    right.addFloatDictionary(left, key: nil)
}

func <-- (inout left: [String: Float], right: Decoder) {
    guard let rightValue: [String: Float] = right.floatDictionary(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional Float dictionaries

func --> (left: [String: Float]?, right: Encoder) {
    right.addFloatDictionary(left, key: nil)
}

func <-- (inout left: [String: Float]?, right: Decoder) {
    guard let rightValue: [String: Float] = right.floatDictionary(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: CGFloat

func --> (left:CGFloat, right: Encoder) {
    right.addCGFloat(left, key: nil)
}

func <-- (inout left:CGFloat, right: Decoder) {
    guard let rightValue = right.cgFloat(nil) else {
        return
    }

    left = rightValue
}

// MARK: CGFloat Optional

func --> (left:CGFloat?, right: Encoder) {
    right.addCGFloat(left, key: nil)
}

func <-- (inout left:CGFloat?, right: Decoder) {
    guard let rightValue = right.cgFloat(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: CGFloat arrays

func --> (left:Array<CGFloat>, right: Encoder) {
    right.addCGFloatArray(left, key: nil)
}

func <-- (inout left:Array<CGFloat>, right: Decoder) {
    guard let rightValue = right.cgFloatArray(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional CGFloat arrays

func --> (left:Array<CGFloat>?, right: Encoder) {
    right.addCGFloatArray(left, key: nil)
}

func <-- (inout left:Array<CGFloat>?, right: Decoder) {
    guard let rightValue = right.cgFloatArray(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: CGFloat dictionaries

func --> (left: [String: CGFloat], right: Encoder) {
    right.addCGFloatDictionary(left, key: nil)
}

func <-- (inout left: [String: CGFloat], right: Decoder) {
    guard let rightValue: [String: CGFloat] = right.cgFloatDictionary(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional CGFloat dictionaries

func --> (left: [String: CGFloat]?, right: Encoder) {
    right.addCGFloatDictionary(left, key: nil)
}

func <-- (inout left: [String: CGFloat]?, right: Decoder) {
    guard let rightValue: [String: CGFloat] = right.cgFloatDictionary(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Double

func --> (left:Double, right: Encoder) {
    right.addDouble(left, key: nil)
}

func <-- (inout left:Double, right: Decoder) {
    guard let rightValue = right.double(nil) else {
        return
    }

    left = rightValue
}

// MARK: Double Optional

func --> (left:Double?, right: Encoder) {
    right.addDouble(left, key: nil)
}

func <-- (inout left:Double?, right: Decoder) {
    guard let rightValue = right.double(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Double arrays

func --> (left:Array<Double>, right: Encoder) {
    right.addDoubleArray(left, key: nil)
}

func <-- (inout left:Array<Double>, right: Decoder) {
    guard let rightValue = right.doubleArray(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional double arrays

func --> (left:Array<Double>?, right: Encoder) {
    right.addDoubleArray(left, key: nil)
}

func <-- (inout left:Array<Double>?, right: Decoder) {
    guard let rightValue = right.doubleArray(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Double dictionaries

func --> (left: [String: Double], right: Encoder) {
    right.addDoubleDictionary(left, key: nil)
}

func <-- (inout left: [String: Double], right: Decoder) {
    guard let rightValue: [String: Double] = right.doubleDictionary(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional Double dictionaries

func --> (left: [String: Double]?, right: Encoder) {
    right.addDoubleDictionary(left, key: nil)
}

func <-- (inout left: [String: Double]?, right: Decoder) {
    guard let rightValue: [String: Double] = right.doubleDictionary(nil) else {
        left = nil
        return
    }

    left = rightValue
}