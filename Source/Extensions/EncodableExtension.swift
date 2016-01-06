//
//  EncodableExtension.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

protocol EncodableExtension {}

func --> <T: Encodable>(left:T, right: Encoder) {
    right.addEncodable(left)
}

func <-- <T: Encodable>(inout left:T, right: Decoder) {
    left = T(right)!
}

extension Encoder : EncodableExtension {
    func addEncodable(encodable: Encodable) {
        guard let key = currentKey else {
            return
        }

        let encoder = Encoder()
        encodable.encode(encoder)

        setValue(key, value: encoder.data)
    }
}

extension Decoder : EncodableExtension {
    
}