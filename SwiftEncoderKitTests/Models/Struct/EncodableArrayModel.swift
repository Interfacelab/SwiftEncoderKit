//
//  EncodableView.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/4/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

class EncodableArrayModel : Encodable {
    var rect: [EncodableRect] = []
    var rectOpt: [EncodableRect]?
    var rectOptNil: [EncodableRect]?

    init() {

    }

    required init?(_ decoder: Decoder) {
        rect <-- decoder["rect"]
        rectOpt <-- decoder["rectOpt"]
        rectOptNil <-- decoder["rectOptNil"]
    }

    func encode(encoder: Encoder) {
        rect --> encoder["rect"]
        rectOpt --> encoder["rectOpt"]
        rectOptNil --> encoder["rectOptNil"]
    }
}