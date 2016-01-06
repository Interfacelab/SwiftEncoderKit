//
//  DecodingOperators.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/1/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

infix operator <-- {}

// MARK: Integer values

func <-- <T: SignedIntegerType>(inout left:T, right: Decoder) {
    guard let rightValue = right.getSignedIntegerValue(left) else {
        return
    }

    left = rightValue
}

func <-- <T: UnsignedIntegerType>(inout left:T, right: Decoder) {
    guard let rightValue = right.getUnsignedIntegerValue(left) else {
        return
    }

    left = rightValue
}

// MARK: Optional integer values

func <-- <T: SignedIntegerType>(inout left:T?, right: Decoder) {
    guard let rightValue = right.getSignedIntegerValue(left) else {
        return
    }

    left = rightValue
}

func <-- <T: UnsignedIntegerType>(inout left:T?, right: Decoder) {
    guard let rightValue = right.getUnsignedIntegerValue(left) else {
        return
    }

    left = rightValue
}

func <-- <T: Encodable>(inout left:T, right: Decoder) {
    left = T(right)!
}