//
//  BasicTypesExtension.swift
//  SwiftEncoderKit
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.


import Foundation

// MARK: Bool

func --> (left: Bool, right: Encoder) {
    right.addBool(left, key: nil)
}

func <-- (inout left: Bool, right: Decoder) {
    guard let rightValue = right.bool(nil) else {
        return
    }

    left = rightValue
}

// MARK: Bool Optional

func --> (left: Bool?, right: Encoder) {
    right.addBool(left, key: nil)
}

func <-- (inout left: Bool?, right: Decoder) {
    guard let rightValue = right.bool(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Bool arrays

func --> (left: Array<Bool>, right: Encoder) {
    right.addBoolArray(left, key: nil)
}

func <-- (inout left: Array<Bool>, right: Decoder) {
    guard let rightValue = right.boolArray(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional bool arrays

func --> (left: Array<Bool>?, right: Encoder) {
    right.addBoolArray(left, key: nil)
}

func <-- (inout left: Array<Bool>?, right: Decoder) {
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