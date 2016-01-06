//
//  CATransform3DModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/5/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import QuartzCore

class CATransform3DModel: Encodable {
    var t3d: CATransform3D = CATransform3DIdentity
    var t3dOpt: CATransform3D? = CATransform3DIdentity
    var t3dOptNil: CATransform3D?

    var t3dA: [CATransform3D] = []
    var t3dOptA: [CATransform3D]? = []
    var t3dOptNilA: [CATransform3D]?

    var t3dD: [String: CATransform3D] = [:]
    var t3dOptD: [String: CATransform3D]? = [:]
    var t3dOptNilD: [String: CATransform3D]?

    init() {

    }

    required init?(_ decoder: Decoder) {
        t3d <-- decoder["t3d"]
        t3dOpt <-- decoder["t3dOpt"]
        t3dOptNil <-- decoder["t3dOptNil"]
        t3dA <-- decoder["t3dA"]
        t3dOptA <-- decoder["t3dOptA"]
        t3dOptNilA <-- decoder["t3dOptNilA"]
        t3dD <-- decoder["t3dD"]
        t3dOptD <-- decoder["t3dOptD"]
        t3dOptNilD <-- decoder["t3dOptNilD"]
    }

    func encode(encoder: Encoder) {
        t3d --> encoder["t3d"]
        t3dOpt --> encoder["t3dOpt"]
        t3dOptNil --> encoder["t3dOptNil"]
        t3dA --> encoder["t3dA"]
        t3dOptA --> encoder["t3dOptA"]
        t3dOptNilA --> encoder["t3dOptNilA"]
        t3dD --> encoder["t3dD"]
        t3dOptD --> encoder["t3dOptD"]
        t3dOptNilD --> encoder["t3dOptNilD"]
    }
}