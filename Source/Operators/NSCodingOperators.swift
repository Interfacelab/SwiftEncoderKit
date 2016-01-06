//
//  NSCodingExtension.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

// MARK: NSCoding

func --> <T: NSCoding>(left:T, right: Encoder) {
    right.addNSCoding(left, key: nil)
}

func <-- <T: NSCoding>(inout left:T, right: Decoder) {
    guard let rightValue: T = right.nsCoding(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional NSCoding

func --> <T: NSCoding>(left:T?, right: Encoder) {
    right.addNSCoding(left, key: nil)
}

func <-- <T: NSCoding>(inout left:T?, right: Decoder) {
    guard let rightValue: T = right.nsCoding(nil) else {
        return
    }

    left = rightValue
}


// MARK: NSCoding arrays

func --> <T: NSCoding>(left:Array<T>, right: Encoder) {
    right.addNSCodingArray(left, key: nil)
}

func <-- <T: NSCoding>(inout left:Array<T>, right: Decoder) {
    guard let rightValue: Array<T> = right.nsCodingArray(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional NSCoding arrays

func --> <T: NSCoding>(left:Array<T>?, right: Encoder) {
    right.addNSCodingArray(left, key: nil)
}

func <-- <T: NSCoding>(inout left:Array<T>?, right: Decoder) {
    guard let rightValue: Array<T> = right.nsCodingArray(nil) else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: NSCoding dictionaries

func --> <T: NSCoding>(left: [String: T], right: Encoder) {
    right.addNSCodingDictionary(left, key: nil)
}

func <-- <T: NSCoding>(inout left: [String: T], right: Decoder) {
    guard let rightValue: [String: T] = right.nsCodingDictionary(nil) else {
        return
    }

    left = rightValue
}

// MARK: Optional NSCoding dictionaries

func --> <T: NSCoding>(left: [String: T]?, right: Encoder) {
    right.addNSCodingDictionary(left, key: nil)
}

func <-- <T: NSCoding>(inout left: [String: T]?, right: Decoder) {
    guard let rightValue: [String: T] = right.nsCodingDictionary(nil) else {
        left = nil
        return
    }

    left = rightValue
}