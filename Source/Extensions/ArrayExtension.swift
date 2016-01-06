//
//  ArrayExtension.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

protocol ArrayExtension {}

func --> (left:Array<Encodable>, right: Encoder) {
    right.addArrayOfEncodable(left)
}

func <-- <T: Encodable>(inout left:Array<T>, right: Decoder) {
    guard let rightValue:Array<T> = right.getArrayOfEncodable() else {
        return
    }

    left = rightValue
}

extension Encoder : ArrayExtension {
    func addArrayOfEncodable(arrayOfEncodable: Array<Encodable>?) {
        guard let array = arrayOfEncodable else {
            setValueForCurrentKey(nil)
            return
        }

        var encoded: [[String: NSCoding]] = []
        for ele in array {
            let encoder=Encoder()
            ele.encode(encoder)
            encoded.append(encoder.data)
        }

        setValueForCurrentKey(encoded)
    }
}

extension Decoder : ArrayExtension {
    func getArrayOfEncodable<T: Encodable>() -> Array<T>? {
        guard let val = valueForCurrentKey() as? Array<[String: AnyObject]> else {
            return nil
        }

        var decoded: [T] = []

        for ele in val {
            let decoder=Decoder(dict: ele)
            decoded.append(T(decoder)!)
        }

        return decoded
    }
}