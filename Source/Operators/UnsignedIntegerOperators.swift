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

// MARK: Integer values

func --> <T: UnsignedIntegerType>(left:T, right: Encoder) {
    right.addUnsignedInteger(left, key:nil)
}

func <-- <T: UnsignedIntegerType>(inout left:T, right: Decoder) {
    guard let rightValue: T = right.unsignedInteger(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional integer values

func --> <T: UnsignedIntegerType>(left:T?, right: Encoder) {
    right.addUnsignedInteger(left, key:nil)
}

func <-- <T: UnsignedIntegerType>(inout left:T?, right: Decoder) {
    guard let rightValue: T = right.unsignedInteger(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Integer arrays

func --> <T: UnsignedIntegerType>(left:Array<T>, right: Encoder) {
    right.addUnsignedIntegerArray(left, key:nil)
}

func <-- <T: UnsignedIntegerType>(inout left:Array<T>, right: Decoder) {
    guard let rightValue:Array<T> = right.unsignedIntegerArray(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional integer arrays

func --> <T: UnsignedIntegerType>(left:Array<T>?, right: Encoder) {
    right.addUnsignedIntegerArray(left, key:nil)
}

func <-- <T: UnsignedIntegerType>(inout left:Array<T>?, right: Decoder) {
    guard let rightValue:Array<T> = right.unsignedIntegerArray(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Integer dictionaries

func --> <T: UnsignedIntegerType>(left: [String: T], right: Encoder) {
    right.addUnsignedIntegerDictionary(left, key:nil)
}

func <-- <T: UnsignedIntegerType>(inout left: [String: T], right: Decoder) {
    guard let rightValue: [String: T] = right.unsignedIntegerDictionary(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional Integer dictionaries

func --> <T: UnsignedIntegerType>(left: [String: T]?, right: Encoder) {
    right.addUnsignedIntegerDictionary(left, key:nil)
}

func <-- <T: UnsignedIntegerType>(inout left: [String: T]?, right: Decoder) {
    guard let rightValue: [String: T] = right.unsignedIntegerDictionary(nil) else {
        left = nil
        return
    }

    left = rightValue
}