//
//  CGRectModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/5/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import QuartzCore

class ConstCGRectModel: Encodable {
    let rect: CGRect
    let rectOpt: CGRect?
    let rectOptNil: CGRect?

    let rectA: [CGRect]
    let rectOptA: [CGRect]?
    let rectOptNilA: [CGRect]?

    let rectD: [String: CGRect]
    let rectOptD: [String: CGRect]?
    let rectOptNilD: [String: CGRect]?

    init(rect: CGRect,
        rectOpt: CGRect?,
        rectOptNil: CGRect?,
        rectA: [CGRect],
        rectOptA: [CGRect]?,
        rectOptNilA: [CGRect]?,
        rectD: [String: CGRect],
        rectOptD: [String: CGRect]?,
        rectOptNilD: [String: CGRect]?) {
            self.rect = rect
            self.rectOpt = rectOpt
            self.rectOptNil = rectOptNil
            self.rectA = rectA
            self.rectOptA = rectOptA
            self.rectOptNilA = rectOptNilA
            self.rectD = rectD
            self.rectOptD = rectOptD
            self.rectOptNilD = rectOptNilD
    }

    required init?(_ decoder: Decoder) {
        rect = decoder.encodable("rect")!
        rectOpt = decoder.encodable("rectOpt")
        rectOptNil = decoder.encodable("rectOptNil")

        rectA = decoder.encodableArray("rectA")!
        rectOptA = decoder.encodableArray("rectOptA")
        rectOptNilA = decoder.encodableArray("rectOptNilA")

        rectD = decoder.encodableDictionary("rectD")!
        rectOptD = decoder.encodableDictionary("rectOptD")
        rectOptNilD = decoder.encodableDictionary("rectOptNilD")
    }

    func encode(encoder: Encoder) {
        rect --> encoder["rect"]
        rectOpt --> encoder["rectOpt"]
        rectOptNil --> encoder["rectOptNil"]

        rectA --> encoder["rectA"]
        rectOptA --> encoder["rectOptA"]
        rectOptNilA --> encoder["rectOptNilA"]
        
        rectD --> encoder["rectD"]
        rectOptD --> encoder["rectOptD"]
        rectOptNilD --> encoder["rectOptNilD"]
    }
    
}