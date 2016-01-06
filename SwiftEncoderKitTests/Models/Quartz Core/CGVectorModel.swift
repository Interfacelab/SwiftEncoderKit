//
//  CGVectorModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/5/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import QuartzCore

class CGVectorModel: Encodable {
    var vector: CGVector = CGVector.zero
    var vectorOpt: CGVector?
    var vectorOptNil: CGVector? = CGVector.zero

    var vectorA: [CGVector] = []
    var vectorOptA: [CGVector]?
    var vectorOptNilA: [CGVector]? = []

    var vectorD: [String: CGVector] = [:]
    var vectorOptD: [String: CGVector]?
    var vectorOptNilD: [String: CGVector]? = [:]

    init() {

    }

    required init?(_ decoder: Decoder) {
        vector <-- decoder["vector"]
        vectorOpt <-- decoder["vectorOpt"]
        vectorOptNil <-- decoder["vectorOptNil"]
        vectorA <-- decoder["vectorA"]
        vectorOptA <-- decoder["vectorOptA"]
        vectorOptNilA <-- decoder["vectorOptNilA"]
        vectorD <-- decoder["vectorD"]
        vectorOptD <-- decoder["vectorOptD"]
        vectorOptNilD <-- decoder["vectorOptNilD"]
    }

    func encode(encoder: Encoder) {
        vector --> encoder["vector"]
        vectorOpt --> encoder["vectorOpt"]
        vectorOptNil --> encoder["vectorOptNil"]
        vectorA --> encoder["vectorA"]
        vectorOptA --> encoder["vectorOptA"]
        vectorOptNilA --> encoder["vectorOptNilA"]
        vectorD --> encoder["vectorD"]
        vectorOptD --> encoder["vectorOptD"]
        vectorOptNilD --> encoder["vectorOptNilD"]
    }
    
}