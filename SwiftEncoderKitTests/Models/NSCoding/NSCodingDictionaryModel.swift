//
//  NSCodingModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/3/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

import UIKit

class NSCodingDictionaryModel : Encodable {
    var imageD: [String: UIImage]
    var imageOptD: [String: UIImage]?
    var imageOptNilD: [String: UIImage]?

    var colorD: [String: UIColor]
    var colorOptD: [String: UIColor]?
    var colorOptNilD: [String: UIColor]?

    init() {
        imageD = [:]
        colorD = [:]
    }

    required init?(_ decoder: Decoder) {
        // This non-optional hasn't been initialized yet, so we can't use the
        // <-- infix operator
        imageD = decoder.nsCodingDictionary("imageD") ?? [:]

        imageOptD <-- decoder["imageOptD"]
        imageOptNilD <-- decoder["imageOptNilD"]

        // This non-optional hasn't been initialized yet, so we can't use the
        // <-- infix operator
        colorD = decoder.nsCodingDictionary("colorD") ?? [:]

        colorOptD <-- decoder["colorOptD"]
        colorOptNilD <-- decoder["colorOptNilD"]
    }

    func encode(encoder: Encoder) {
        imageD --> encoder["imageD"]
        imageOptD --> encoder["imageOptD"]
        imageOptNilD --> encoder["imageOptNilD"]

        colorD --> encoder["colorD"]
        colorOptD --> encoder["colorOptD"]
        colorOptNilD --> encoder["colorOptNilD"]
    }
}
