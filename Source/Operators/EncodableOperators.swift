//
//  EncodableExtension.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

// MARK: Encodable values

func --> <T: Encodable>(left:T, right: Encoder) {
    right.addEncodable(left, key: nil)
}

func <-- <T: Encodable>(inout left:T, right: Decoder) {
    guard let rightValue: T = right.encodable(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional Encodable values

func --> <T: Encodable>(left:T?, right: Encoder) {
    right.addEncodable(left, key: nil)
}

func <-- <T: Encodable>(inout left:T?, right: Decoder) {
    guard let rightValue: T = right.encodable(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Encodable arrays

func --> <T: Encodable>(left:Array<T>, right: Encoder) {
    right.addEncodableArray(left, key: nil)
}

func <-- <T: Encodable>(inout left:Array<T>, right: Decoder) {
    guard let rightValue:Array<T> = right.encodableArray(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional encodable arrays

func --> <T: Encodable>(left:Array<T>?, right: Encoder) {
    right.addEncodableArray(left, key: nil)
}

func <-- <T: Encodable>(inout left:Array<T>?, right: Decoder) {
    guard let rightValue:Array<T> = right.encodableArray(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Encodable dictionaries

func --> <T: Encodable>(left: [String: T], right: Encoder) {
    right.addEncodableDictionary(left, key: nil)
}

func <-- <T: Encodable>(inout left: [String: T], right: Decoder) {
    guard let rightValue: [String: T] = right.encodableDictionary(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional Encodable dictionaries

func --> <T: Encodable>(left: [String: T]?, right: Encoder) {
    right.addEncodableDictionary(left, key: nil)
}

func <-- <T: Encodable>(inout left: [String: T]?, right: Decoder) {
    guard let rightValue: [String: T] = right.encodableDictionary(nil) else {
        left = nil
        return
    }

    left = rightValue
}
