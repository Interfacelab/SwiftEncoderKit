//
//  TestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//

class UnsignedIntegerDictionaryModel: Encodable {
    var uint: [String: UInt] = [:]
    var uint8: [String: UInt8] = [:]
    var uint16: [String: UInt16] = [:]
    var uint32: [String: UInt32] = [:]
    var uint64: [String: UInt64] = [:]

    var uintOpt: [String: UInt]?
    var uint8Opt: [String: UInt8]?
    var uint16Opt: [String: UInt16]?
    var uint32Opt: [String: UInt32]?
    var uint64Opt: [String: UInt64]?

    var uintOptNil: [String: UInt]? = [:]
    var uint8OptNil: [String: UInt8]? = [:]
    var uint16OptNil: [String: UInt16]? = [:]
    var uint32OptNil: [String: UInt32]? = [:]
    var uint64OptNil: [String: UInt64]? = [:]

    init() {

    }

    required init?(_ decoder: Decoder) {
        uint     <-- decoder["uint"]
        uint8    <-- decoder["uint8"]
        uint16   <-- decoder["uint16"]
        uint32   <-- decoder["uint32"]
        uint64   <-- decoder["uint64"]

        uintOpt     <-- decoder["uintOpt"]
        uint8Opt    <-- decoder["uint8Opt"]
        uint16Opt   <-- decoder["uint16Opt"]
        uint32Opt   <-- decoder["uint32Opt"]
        uint64Opt   <-- decoder["uint64Opt"]

        uintOptNil     <-- decoder["uintOptNil"]
        uint8OptNil    <-- decoder["uint8OptNil"]
        uint16OptNil   <-- decoder["uint16OptNil"]
        uint32OptNil   <-- decoder["uint32OptNil"]
        uint64OptNil   <-- decoder["uint64OptNil"]
    }

    func encode(encoder: Encoder) {
        uint     --> encoder["uint"]
        uint8    --> encoder["uint8"]
        uint16   --> encoder["uint16"]
        uint32   --> encoder["uint32"]
        uint64   --> encoder["uint64"]

        uintOpt     --> encoder["uintOpt"]
        uint8Opt    --> encoder["uint8Opt"]
        uint16Opt   --> encoder["uint16Opt"]
        uint32Opt   --> encoder["uint32Opt"]
        uint64Opt   --> encoder["uint64Opt"]

        uintOptNil     --> encoder["uintOptNil"]
        uint8OptNil    --> encoder["uint8OptNil"]
        uint16OptNil   --> encoder["uint16OptNil"]
        uint32OptNil   --> encoder["uint32OptNil"]
        uint64OptNil   --> encoder["uint64OptNil"]
    }
}
