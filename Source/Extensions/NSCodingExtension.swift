//
//  NSCodingExtension.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

protocol NSCodingExtension {}

func --> <T: NSCoding>(left:T, right: Encoder) {
    right.addNSCoding(left)
}

func --> <T: NSCoding>(left:T?, right: Encoder) {
    right.addNSCoding(left)
}

func <-- <T: NSCoding>(inout left:T, right: Decoder) {
    guard let rightValue = right.getNSCoder(left) else {
        return
    }

    left = rightValue
}

func <-- <T: NSCoding>(inout left:T?, right: Decoder) {
    guard let rightValue = right.getNSCoder(left) else {
        return
    }

    left = rightValue
}

extension Encoder : NSCodingExtension {
    func addNSCoding(object: NSCoding?) {
        setValueForCurrentKey(object)
    }
}

extension Decoder : NSCodingExtension {
    func getNSCoder<T: NSCoding>(object: T?) -> T? {
        guard let val = valueForCurrentKey() as? NSCoding else {
            return nil
        }

        return val as? T
    }
}