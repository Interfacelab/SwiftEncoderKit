//
//  TestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//

class ConstUnsignedIntegerModel: Encodable {
    let uint: UInt
    let uint8: UInt8
    let uint16: UInt16
    let uint32: UInt32
    let uint64: UInt64

    let uintOpt: UInt?
    let uint8Opt: UInt8?
    let uint16Opt: UInt16?
    let uint32Opt: UInt32?
    let uint64Opt: UInt64?

    let uintOptNil: UInt?
    let uint8OptNil: UInt8?
    let uint16OptNil: UInt16?
    let uint32OptNil: UInt32?
    let uint64OptNil: UInt64?

    init(uint: UInt, uint8: UInt8, uint16: UInt16, uint32: UInt32, uint64: UInt64, uintOpt: UInt?,
        uint8Opt: UInt8?, uint16Opt: UInt16?, uint32Opt: UInt32?, uint64Opt: UInt64?, uintOptNil: UInt?,
        uint8OptNil: UInt8?, uint16OptNil: UInt16?, uint32OptNil: UInt32?, uint64OptNil: UInt64?) {
            self.uint = uint
            self.uint8 = uint8
            self.uint16 = uint16
            self.uint32 = uint32
            self.uint64 = uint64

            self.uintOpt = uintOpt
            self.uint8Opt = uint8Opt
            self.uint16Opt = uint16Opt
            self.uint32Opt = uint32Opt
            self.uint64Opt = uint64Opt

            self.uintOptNil = uintOptNil
            self.uint8OptNil = uint8OptNil
            self.uint16OptNil = uint16OptNil
            self.uint32OptNil = uint32OptNil
            self.uint64OptNil = uint64OptNil
    }

    required init?(_ decoder: Decoder) {
        // Because all of our properties are constants and haven't been initialized yet
        // the <-- infix operator won't work here, so we'll use the methods on the
        // decoder to get our values
        
        uint = decoder.unsignedInteger("uint") ?? 0
        uint8 = decoder.unsignedInteger("uint8") ?? 0
        uint16 = decoder.unsignedInteger("uint16") ?? 0
        uint32 = decoder.unsignedInteger("uint32") ?? 0
        uint64 = decoder.unsignedInteger("uint64") ?? 0

        uintOpt = decoder.unsignedInteger("uintOpt")
        uint8Opt = decoder.unsignedInteger("uint8Opt")
        uint16Opt = decoder.unsignedInteger("uint16Opt")
        uint32Opt = decoder.unsignedInteger("uint32Opt")
        uint64Opt = decoder.unsignedInteger("uint64Opt")

        uintOptNil = decoder.unsignedInteger("uintOptNil")
        uint8OptNil = decoder.unsignedInteger("uint8OptNil")
        uint16OptNil = decoder.unsignedInteger("uint16OptNil")
        uint32OptNil = decoder.unsignedInteger("uint32OptNil")
        uint64OptNil = decoder.unsignedInteger("uint64OptNil")
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
