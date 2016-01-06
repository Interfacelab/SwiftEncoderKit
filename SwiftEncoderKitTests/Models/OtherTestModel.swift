//
//  OtherTestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//

import UIKit
import ObjectMapper

class OtherTestModel: Encodable {
    var x: Int = 12

    init() {

    }

    required init?(_ decoder: Decoder) {
        x <-- decoder["x"]
    }

    func encode(encoder: Encoder) {
        x --> encoder["x"]
    }
}
