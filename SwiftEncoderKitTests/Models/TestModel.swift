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

class TestModel: Encodable {
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

    var uint:UInt = 1
    var uint8:UInt8 = 2
    var uint16:UInt16 = 3
    var uint32:UInt32 = 4
    var uint64:UInt64 = 5

    var uintOpt:UInt?
    var uint8Opt:UInt8?
    var uint16Opt:UInt16?
    var uint32Opt:UInt32?
    var uint64Opt:UInt64?

    var time:CMTime = CMTime(seconds: 5, preferredTimescale: 30000)
    var timeRange:CMTimeRange = CMTimeRange(start: CMTime(seconds: 6, preferredTimescale: 30000), duration: CMTime(seconds: 10, preferredTimescale: 30000))

    var otherModel: OtherTestModel = OtherTestModel()

    var stringArray:[String]=["Hello", "There"]
    var intArray:[Int]=[1,2,3,4]

    var standardDict:[String: AnyObject]=["Hello":"There"]

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

        uint    <-- decoder["uint"]
        uint8   <-- decoder["uint8"]
        uint16  <-- decoder["uint16"]
        uint32  <-- decoder["uint32"]
        uint64  <-- decoder["uint64"]

        uintOpt    <-- decoder["uintOpt"]
        uint8Opt   <-- decoder["uint8Opt"]
        uint16Opt  <-- decoder["uint16Opt"]
        uint32Opt  <-- decoder["uint32Opt"]
        uint64Opt  <-- decoder["uint64Opt"]
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

        uint    --> encoder["uint"]
        uint8   --> encoder["uint8"]
        uint16  --> encoder["uint16"]
        uint32  --> encoder["uint32"]
        uint64  --> encoder["uint64"]

        uintOpt    --> encoder["uintOpt"]
        uint8Opt   --> encoder["uint8Opt"]
        uint16Opt  --> encoder["uint16Opt"]
        uint32Opt  --> encoder["uint32Opt"]
        uint64Opt  --> encoder["uint64Opt"]
    }
}
