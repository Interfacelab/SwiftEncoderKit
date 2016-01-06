//
//  EncodableView.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/4/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

class ConstEncodableArrayModel : Encodable {
    let rect: [EncodableRect]
    let rectOpt: [EncodableRect]?
    let rectOptNil: [EncodableRect]?

    init(rect: [EncodableRect], rectOpt: [EncodableRect]?, rectOptNil: [EncodableRect]?) {
        self.rect = rect
        self.rectOpt = rectOpt
        self.rectOptNil = rectOptNil
    }

    required init?(_ decoder: Decoder) {
        rect = decoder.encodableArray("rect") ?? []
        rectOpt = decoder.encodableArray("rectOpt")
        rectOptNil = decoder.encodableArray("rectOptNil")
    }

    func encode(encoder: Encoder) {
        encoder.addEncodableArray(rect, key: "rect")
        encoder.addEncodableArray(rectOpt, key: "rectOpt")
        encoder.addEncodableArray(rectOptNil, key: "rectOptNil")
    }
}