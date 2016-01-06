//
//  CoreAnimationEncoding.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/5/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import QuartzCore

extension CATransform3D: Encodable {
    init?(_ decoder: Decoder) {
        m11 = decoder.cgFloat("m11")!
        m12 = decoder.cgFloat("m12")!
        m13 = decoder.cgFloat("m13")!
        m14 = decoder.cgFloat("m14")!
        m21 = decoder.cgFloat("m21")!
        m22 = decoder.cgFloat("m22")!
        m23 = decoder.cgFloat("m23")!
        m24 = decoder.cgFloat("m24")!
        m31 = decoder.cgFloat("m31")!
        m32 = decoder.cgFloat("m32")!
        m33 = decoder.cgFloat("m33")!
        m34 = decoder.cgFloat("m34")!
        m41 = decoder.cgFloat("m41")!
        m42 = decoder.cgFloat("m42")!
        m43 = decoder.cgFloat("m43")!
        m44 = decoder.cgFloat("m44")!
    }

    func encode(encoder: Encoder) {
        m11 --> encoder["m11"]
        m12 --> encoder["m12"]
        m13 --> encoder["m13"]
        m14 --> encoder["m14"]
        m21 --> encoder["m21"]
        m22 --> encoder["m22"]
        m23 --> encoder["m23"]
        m24 --> encoder["m24"]
        m31 --> encoder["m31"]
        m32 --> encoder["m32"]
        m33 --> encoder["m33"]
        m34 --> encoder["m34"]
        m41 --> encoder["m41"]
        m42 --> encoder["m42"]
        m43 --> encoder["m43"]
        m44 --> encoder["m44"]
    }
}

