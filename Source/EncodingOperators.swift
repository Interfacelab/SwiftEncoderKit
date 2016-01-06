//
//  EncodingOperators.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/1/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

infix operator --> {}


// MARK: Integer values

func --> <T: SignedIntegerType>(left:T, right: Encoder) {
    right.addSignedInteger(left)
}
func --> <T: UnsignedIntegerType>(left:T, right: Encoder) {
    right.addUnsignedInteger(left)
}

// MARK: Optional integer values

func --> <T: SignedIntegerType>(left:T?, right: Encoder) {
    guard left != nil else {
        return
    }

    right.addSignedInteger(left)
}

func --> <T: UnsignedIntegerType>(left:T?, right: Encoder) {
    guard left != nil else {
        return
    }

    right.addUnsignedInteger(left)
}

// MARK: NSCoding Protocol

func --> <T: NSCoding>(left:T, right: Encoder) {
    right.addNSCoding(left)
}

func --> <T: NSCoding>(left:T?, right: Encoder) {
    right.addNSCoding(left)
}

// MARK: Encodable protocol

func --> <T: Encodable>(left:T, right: Encoder) {
    right.addEncodable(left)
}