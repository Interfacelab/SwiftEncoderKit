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