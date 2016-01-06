//
//  EncodableView.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/4/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

class ConstEncodableDictionaryModel : Encodable {
    let rect: [String: EncodableRect]
    let rectOpt: [String: EncodableRect]?
    let rectOptNil: [String: EncodableRect]?

    init(rect: [String: EncodableRect], rectOpt: [String: EncodableRect]?,
        rectOptNil: [String: EncodableRect]?) {
        self.rect = rect
        self.rectOpt = rectOpt
        self.rectOptNil = rectOptNil
    }

    required init?(_ decoder: Decoder) {
        rect = decoder.encodableDictionary("rect") ?? [:]
        rectOpt = decoder.encodableDictionary("rectOpt")
        rectOptNil = decoder.encodableDictionary("rectOptNil")
    }

    func encode(encoder: Encoder) {
        rect --> encoder["rect"]
        rectOpt --> encoder["rectOpt"]
        rectOptNil --> encoder["rectOptNil"]
    }
}