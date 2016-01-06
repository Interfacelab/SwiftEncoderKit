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

    var intOptNil:Int? = 1
    var int8OptNil:Int8? = 2
    var int16OptNil:Int16? = 3
    var int32OptNil:Int32? = 4
    var int64OptNil:Int64? = 5

    var intA: [Int] = []
    var int8A: [Int8] = []
    var int16A: [Int16] = []
    var int32A: [Int32] = []
    var int64A: [Int64] = []

    var intAOpt: [Int]?
    var int8AOpt: [Int8]?
    var int16AOpt: [Int16]?
    var int32AOpt: [Int32]?
    var int64AOpt: [Int64]?

    var intAOptNil: [Int]? = [1,2,3,4]
    var int8AOptNil: [Int8]? = [1,2,3,4]
    var int16AOptNil: [Int16]? = [1,2,3,4]
    var int32AOptNil: [Int32]? = [1,2,3,4]
    var int64AOptNil: [Int64]? = [1,2,3,4]

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

        intOptNil     <-- decoder["intOptNil"]
        int8OptNil    <-- decoder["int8OptNil"]
        int16OptNil   <-- decoder["int16OptNil"]
        int32OptNil   <-- decoder["int32OptNil"]
        int64OptNil   <-- decoder["int64OptNil"]

        intA     <-- decoder["intA"]
        int8A    <-- decoder["int8A"]
        int16A   <-- decoder["int16A"]
        int32A   <-- decoder["int32A"]
        int64A   <-- decoder["int64A"]

        intAOpt     <-- decoder["intAOpt"]
        int8AOpt    <-- decoder["int8AOpt"]
        int16AOpt   <-- decoder["int16AOpt"]
        int32AOpt   <-- decoder["int32AOpt"]
        int64AOpt   <-- decoder["int64AOpt"]

        intAOptNil     <-- decoder["intAOptNil"]
        int8AOptNil    <-- decoder["int8AOptNil"]
        int16AOptNil   <-- decoder["int16AOptNil"]
        int32AOptNil   <-- decoder["int32AOptNil"]
        int64AOptNil   <-- decoder["int64AOptNil"]
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

        intOptNil     --> encoder["intOptNil"]
        int8OptNil    --> encoder["int8OptNil"]
        int16OptNil   --> encoder["int16OptNil"]
        int32OptNil   --> encoder["int32OptNil"]
        int64OptNil   --> encoder["int64OptNil"]

        intA     --> encoder["intA"]
        int8A    --> encoder["int8A"]
        int16A   --> encoder["int16A"]
        int32A   --> encoder["int32A"]
        int64A   --> encoder["int64A"]

        intAOpt     --> encoder["intAOpt"]
        int8AOpt    --> encoder["int8AOpt"]
        int16AOpt   --> encoder["int16AOpt"]
        int32AOpt   --> encoder["int32AOpt"]
        int64AOpt   --> encoder["int64AOpt"]

        intAOptNil     --> encoder["intAOptNil"]
        int8AOptNil    --> encoder["int8AOptNil"]
        int16AOptNil   --> encoder["int16AOptNil"]
        int32AOptNil   --> encoder["int32AOptNil"]
        int64AOptNil   --> encoder["int64AOptNil"]
    }
}
