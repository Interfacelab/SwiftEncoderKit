//
//  EncodableView.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/4/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

class ConstEncodableModel : Encodable {
    let rect: EncodableRect
    let rectOpt: EncodableRect?
    let rectOptNil: EncodableRect?

    init(rect: EncodableRect, rectOpt: EncodableRect?, rectOptNil: EncodableRect?) {
        self.rect = rect
        self.rectOpt = rectOpt
        self.rectOptNil = rectOptNil
    }

    required init?(_ decoder: Decoder) {
        rect = decoder.encodable("rect") ?? EncodableRect()
        rectOpt = decoder.encodable("rectOpt")
        rectOptNil = decoder.encodable("rectOptNil")
    }

    func encode(encoder: Encoder) {
        encoder.addEncodable(rect, key: "rect")
        encoder.addEncodable(rectOpt, key: "rectOpt")
        encoder.addEncodable(rectOptNil, key: "rectOptNil")
    }
}