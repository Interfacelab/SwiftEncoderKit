//
//  EnumEncoding.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/5/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

// MARK: Enum

func --> <T:RawRepresentable>(left:T, right: Encoder) {
    right.addEnumValue(left, key: nil)
}

func <-- <T:RawRepresentable>(inout left:T, right: Decoder) {
    guard let rightValue: T = right.enumValue(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional Enum

func --> <T:RawRepresentable>(left:T?, right: Encoder) {
    right.addEnumValue(left, key: nil)
}

func <-- <T:RawRepresentable>(inout left:T?, right: Decoder) {
    guard let rightValue: T = right.enumValue(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: enum arrays

func --> <T: RawRepresentable>(left:Array<T>, right: Encoder) {
    right.addEnumArray(left, key:nil)
}

func <-- <T: RawRepresentable>(inout left:Array<T>, right: Decoder) {
    guard let rightValue:Array<T> = right.enumArray(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional enum arrays

func --> <T: RawRepresentable>(left:Array<T>?, right: Encoder) {
    right.addEnumArray(left, key:nil)
}

func <-- <T: RawRepresentable>(inout left:Array<T>?, right: Decoder) {
    guard let rightValue:Array<T> = right.enumArray(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Enum dictionaries

func --> <T: RawRepresentable>(left: [String: T], right: Encoder) {
    right.addEnumDictionary(left, key: nil)
}

func <-- <T: RawRepresentable>(inout left: [String: T], right: Decoder) {
    guard let rightValue: [String: T] = right.enumDictionary(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional Enum dictionaries

func --> <T: RawRepresentable>(left: [String: T]?, right: Encoder) {
    right.addEnumDictionary(left, key: nil)
}

func <-- <T: RawRepresentable>(inout left: [String: T]?, right: Decoder) {
    guard let rightValue: [String: T] = right.enumDictionary(nil) else {
        left = nil
        return
    }

    left = rightValue
}
