//
//  CATransform3DModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/5/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import QuartzCore

class ConstCATransform3DModel: Encodable {
    let t3d: CATransform3D
    let t3dOpt: CATransform3D?
    let t3dOptNil: CATransform3D?

    let t3dA: [CATransform3D]
    let t3dOptA: [CATransform3D]?
    let t3dOptNilA: [CATransform3D]?

    let t3dD: [String: CATransform3D]
    let t3dOptD: [String: CATransform3D]?
    let t3dOptNilD: [String: CATransform3D]?

    init(t3d: CATransform3D,
        t3dOpt: CATransform3D?,
        t3dOptNil: CATransform3D?,
        t3dA: [CATransform3D],
        t3dOptA: [CATransform3D]?,
        t3dOptNilA: [CATransform3D]?,
        t3dD: [String: CATransform3D],
        t3dOptD: [String: CATransform3D]?,
        t3dOptNilD: [String: CATransform3D]?) {
            self.t3d = t3d
            self.t3dOpt = t3dOpt
            self.t3dOptNil = t3dOptNil
            self.t3dA = t3dA
            self.t3dOptA = t3dOptA
            self.t3dOptNilA = t3dOptNilA
            self.t3dD = t3dD
            self.t3dOptD = t3dOptD
            self.t3dOptNilD = t3dOptNilD
    }

    required init?(_ decoder: Decoder) {
        t3d = decoder.encodable("t3d")!
        t3dOpt = decoder.encodable("t3dOpt")
        t3dOptNil = decoder.encodable("t3dOptNil")
        t3dA = decoder.encodableArray("t3dA")!
        t3dOptA = decoder.encodableArray("t3dOptA")
        t3dOptNilA = decoder.encodableArray("t3dOptNilA")
        t3dD = decoder.encodableDictionary("t3dD")!
        t3dOptD = decoder.encodableDictionary("t3dOptD")
        t3dOptNilD = decoder.encodableDictionary("t3dOptNilD")
    }

    func encode(encoder: Encoder) {
        encoder.addEncodable(t3d, key: "t3d")
        encoder.addEncodable(t3dOpt, key: "t3dOpt")
        encoder.addEncodable(t3dOptNil, key: "t3dOptNil")

        encoder.addEncodableArray(t3dA, key: "t3dA")
        encoder.addEncodableArray(t3dOptA, key: "t3dOptA")
        encoder.addEncodableArray(t3dOptNilA, key: "t3dOptNilA")
        
        encoder.addEncodableDictionary(t3dD, key: "t3dD")
        encoder.addEncodableDictionary(t3dOptD, key: "t3dOptD")
        encoder.addEncodableDictionary(t3dOptNilD, key: "t3dOptNilD")
    }
}