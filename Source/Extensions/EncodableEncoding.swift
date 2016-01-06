//
//  EncodableExtension.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

protocol EncodableEncoding {}

func --> <T: Encodable>(left:T, right: Encoder) {
    right.addEncodable(left)
}

func <-- <T: Encodable>(inout left:T, right: Decoder) {
    guard let rightValue: T = right.getEncodable() else {
        return
    }

    left = rightValue
}

extension Encoder : EncodableEncoding {
    func addEncodable(encodable: Encodable) {
        let encoder = Encoder()
        encodable.encode(encoder)

        setValueForCurrentKey(encoder.data)
    }
}

extension Decoder : EncodableEncoding {
    func getEncodable<T: Encodable>() -> T? {
        guard let val = valueForCurrentKey() as? [String: AnyObject] else {
            return nil
        }

        let decoder=Decoder(dict: val)

        return T(decoder)
    }

    func getEncodableNamed<T: Encodable>(key:String) -> T? {
        guard let val = valueForKey(key) as? [String: AnyObject] else {
            return nil
        }

        let decoder=Decoder(dict: val)

        return T(decoder)
    }
}