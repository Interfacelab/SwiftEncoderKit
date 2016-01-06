//
//  NSCodingModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/3/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

import UIKit

class NSCodingModel : Encodable {
    var image:UIImage
    var imageOpt: UIImage?
    var imageOptNil: UIImage?

    var color: UIColor
    var colorOpt: UIColor?
    var colorOptNil: UIColor?

    init() {
        let bundle = NSBundle(forClass: self.dynamicType)
        let path = bundle.pathForResource("test-image", ofType: "jpg")

        image = UIImage(contentsOfFile: path!)!
        color = UIColor.whiteColor()
    }

    required init?(_ decoder: Decoder) {
        let bundle = NSBundle(forClass: self.dynamicType)
        let path = bundle.pathForResource("test-image", ofType: "jpg")

        // This non-optional hasn't been initialized yet, so we can't use the
        // <-- infix operator
        image = decoder.nsCoding("image") ?? UIImage(contentsOfFile: path!)!

        imageOpt <-- decoder["imageOpt"]
        imageOptNil <-- decoder["imageOptNil"]

        // This non-optional hasn't been initialized yet, so we can't use the
        // <-- infix operator
        color = decoder.nsCoding("color") ?? UIColor.whiteColor()

        colorOpt <-- decoder["colorOpt"]
        colorOptNil <-- decoder["colorOptNil"]
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
