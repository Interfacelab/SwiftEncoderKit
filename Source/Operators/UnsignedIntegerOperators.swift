//
//  BasicTypesExtension.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

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