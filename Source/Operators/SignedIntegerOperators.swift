//
//  BasicTypesExtension.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

// MARK: Integer values

func --> <T: SignedIntegerType>(left:T, right: Encoder) {
    right.addInteger(left, key: nil)
}

func <-- <T: SignedIntegerType>(inout left:T, right: Decoder) {
    guard let rightValue: T = right.integer(nil) else {
        return
    }

    left = rightValue
}


// MARK: Integer arrays

func --> <T: SignedIntegerType>(left:Array<T>, right: Encoder) {
    right.addIntegerArray(left, key: nil)
}

func <-- <T: SignedIntegerType>(inout left:Array<T>, right: Decoder) {
    guard let rightValue:Array<T> = right.integerArray(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional integer values

func --> <T: SignedIntegerType>(left:T?, right: Encoder) {
    right.addInteger(left, key: nil)
}

func <-- <T: SignedIntegerType>(inout left:T?, right: Decoder) {
    guard let rightValue: T = right.integer(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Optional integer arrays

func --> <T: SignedIntegerType>(left:Array<T>?, right: Encoder) {
    right.addIntegerArray(left, key: nil)
}

func <-- <T: SignedIntegerType>(inout left:Array<T>?, right: Decoder) {
    guard let rightValue:Array<T> = right.integerArray(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Integer dictionaries

func --> <T: SignedIntegerType>(left: [String: T], right: Encoder) {
    right.addIntegerDictionary(left, key: nil)
}

func <-- <T: SignedIntegerType>(inout left: [String: T], right: Decoder) {
    guard let rightValue: [String: T] = right.integerDictionary(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional Integer dictionaries

func --> <T: SignedIntegerType>(left: [String: T]?, right: Encoder) {
    right.addIntegerDictionary(left, key: nil)
}

func <-- <T: SignedIntegerType>(inout left: [String: T]?, right: Decoder) {
    guard let rightValue: [String: T] = right.integerDictionary(nil) else {
        left = nil
        return
    }

    left = rightValue
}