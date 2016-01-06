//
//  TestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//

import UIKit
import AVFoundation
import ObjectMapper

class SignedIntegerModel: Encodable {
    var int:Int = 1
    var int8:Int8 = 2
    var int16:Int16 = 3
    var int32:Int32 = 4
    var int64:Int64 = 5

    var intOpt:Int?
    var int8Opt:Int8?
    var int16Opt:Int16?
    var int32Opt:Int32?
    var int64Opt:Int64?

    init() {

    }

    required init?(_ decoder: Decoder) {
        int     <-- decoder["int"]
        int8    <-- decoder["int8"]
        int16   <-- decoder["int16"]
        int32   <-- decoder["int32"]
        int64   <-- decoder["int64"]

        intOpt     <-- decoder["intOpt"]
        int8Opt    <-- decoder["int8Opt"]
        int16Opt   <-- decoder["int16Opt"]
        int32Opt   <-- decoder["int32Opt"]
        int64Opt   <-- decoder["int64Opt"]
    }

    func encode(encoder: Encoder) {
        int     --> encoder["int"]
        int8    --> encoder["int8"]
        int16   --> encoder["int16"]
        int32   --> encoder["int32"]
        int64   --> encoder["int64"]

        intOpt     --> encoder["intOpt"]
        int8Opt    --> encoder["int8Opt"]
        int16Opt   --> encoder["int16Opt"]
        int32Opt   --> encoder["int32Opt"]
        int64Opt   --> encoder["int64Opt"]
    }
}
