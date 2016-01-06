//
//  TestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//

import UIKit

class ImageModel: Encodable {
    var image:UIImage
    var imageOpt: UIImage?
    var imageOptNil: UIImage?

    init() {
        let bundle = NSBundle(forClass: self.dynamicType)
        let path = bundle.pathForResource("test-image", ofType: "jpg")

        image = UIImage(contentsOfFile: path!)!
        imageOpt = UIImage(contentsOfFile: path!)!
    }

    required init?(_ decoder: Decoder) {
        let bundle = NSBundle(forClass: self.dynamicType)
        let path = bundle.pathForResource("test-image", ofType: "jpg")

        image = UIImage(contentsOfFile: path!)!
        imageOpt = UIImage(contentsOfFile: path!)!

        image       <-- decoder["image"]
        imageOpt    <-- decoder["imageOpt"]
        imageOptNil <-- decoder["imageOptNil"]
    }

    func encode(encoder: Encoder) {
        image       --> encoder["image"]
        imageOpt    --> encoder["imageOpt"]
        imageOptNil --> encoder["imageOptNil"]
    }
}
