//
//  CGRectModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/5/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import QuartzCore

class CGRectModel: Encodable {
    var rect: CGRect = CGRect.zero
    var rectOpt: CGRect?
    var rectOptNil: CGRect? = CGRect.zero

    var rectA: [CGRect] = []
    var rectOptA: [CGRect]?
    var rectOptNilA: [CGRect]? = []

    var rectD: [String: CGRect] = [:]
    var rectOptD: [String: CGRect]?
    var rectOptNilD: [String: CGRect]? = [:]

    init() {

    }

    required init?(_ decoder: Decoder) {
        rect <-- decoder["rect"]
        rectOpt <-- decoder["rectOpt"]
        rectOptNil <-- decoder["rectOptNil"]
        rectA <-- decoder["rectA"]
        rectOptA <-- decoder["rectOptA"]
        rectOptNilA <-- decoder["rectOptNilA"]
        rectD <-- decoder["rectD"]
        rectOptD <-- decoder["rectOptD"]
        rectOptNilD <-- decoder["rectOptNilD"]
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