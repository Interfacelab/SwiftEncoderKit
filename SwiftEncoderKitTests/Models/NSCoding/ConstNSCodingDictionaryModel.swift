//
//  NSCodingModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/3/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

import UIKit

class ConstNSCodingDictionaryModel : Encodable {
    let imageD: [String: UIImage]
    let imageOptD: [String: UIImage]?
    let imageOptNilD: [String: UIImage]?

    let colorD: [String: UIColor]
    let colorOptD: [String: UIColor]?
    let colorOptNilD: [String: UIColor]?

    init(imageD: [String: UIImage], imageOptD: [String: UIImage]?, imageOptNilD: [String: UIImage]?,
        colorD: [String: UIColor], colorOptD: [String: UIColor]?,
        colorOptNilD: [String: UIColor]?) {

            self.imageD = imageD
            self.imageOptD = imageOptD
            self.imageOptNilD = imageOptNilD

            self.colorD = colorD
            self.colorOptD = colorOptD
            self.colorOptNilD = colorOptNilD
    }

    required init?(_ decoder: Decoder) {
        // Because all of our properties are constants and haven't been initialized yet
        // the <-- infix operator won't work here, so we'll use the methods on the
        // decoder to get our values

        imageD = decoder.nsCodingDictionary("imageD") ?? [:]
        imageOptD = decoder.nsCodingDictionary("imageOptD")
        imageOptNilD = decoder.nsCodingDictionary("imageOptNilD")

        colorD = decoder.nsCodingDictionary("colorD") ?? [:]
        colorOptD = decoder.nsCodingDictionary("colorOptD")
        colorOptNilD = decoder.nsCodingDictionary("colorOptNilD")
    }

    func encode(encoder: Encoder) {
        encoder.addNSCodingDictionary(imageD, key: "imageD")
        encoder.addNSCodingDictionary(imageOptD, key: "imageOptD")
        encoder.addNSCodingDictionary(imageOptNilD, key: "imageOptNilD")
        
        encoder.addNSCodingDictionary(colorD, key: "colorD")
        encoder.addNSCodingDictionary(colorOptD, key: "colorOptD")
        encoder.addNSCodingDictionary(colorOptNilD, key: "colorOptNilD")
    }
}
