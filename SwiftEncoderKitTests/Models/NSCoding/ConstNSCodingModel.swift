//
//  NSCodingModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/3/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

import UIKit

class ConstNSCodingModel : Encodable {
    let image:UIImage
    let imageOpt: UIImage?
    let imageOptNil: UIImage?

    let color: UIColor
    let colorOpt: UIColor?
    let colorOptNil: UIColor?

    init() {
        let bundle = NSBundle(forClass: self.dynamicType)
        let path = bundle.pathForResource("test-image", ofType: "jpg")

        image = UIImage(contentsOfFile: path!)!
        imageOpt = nil
        imageOptNil = UIImage(contentsOfFile: path!)!

        color = UIColor.whiteColor()
        colorOpt = nil
        colorOptNil = UIColor.whiteColor()
    }

    init(image:UIImage, imageOpt: UIImage?, imageOptNil: UIImage?, color: UIColor,
        colorOpt: UIColor?, colorOptNil: UIColor?) {
            self.image = image
            self.imageOpt = imageOpt
            self.imageOptNil = imageOptNil

            self.color = color
            self.colorOpt = colorOpt
            self.colorOptNil = colorOptNil
    }

    required init?(_ decoder: Decoder) {
        let bundle = NSBundle(forClass: self.dynamicType)
        let path = bundle.pathForResource("test-image", ofType: "jpg")

        image = decoder.nsCoding("image") ?? UIImage(contentsOfFile: path!)!
        imageOpt = decoder.nsCoding("imageOpt")
        imageOptNil = decoder.nsCoding("imageOptNil")

        color = decoder.nsCoding("color") ?? UIColor.whiteColor()
        colorOpt = decoder.nsCoding("colorOpt")
        colorOptNil = decoder.nsCoding("colorOptNil")
    }

    func encode(encoder: Encoder) {
        image --> encoder["image"]
        imageOpt --> encoder["imageOpt"]
        imageOptNil --> encoder["imageOptNil"]

        color --> encoder["color"]
        colorOpt --> encoder["colorOpt"]
        colorOptNil --> encoder["colorOptNil"]
    }
}
