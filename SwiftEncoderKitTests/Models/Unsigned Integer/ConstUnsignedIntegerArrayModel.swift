//
//  TestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//

class ConstUnsignedIntegerArrayModel: Encodable {
    let uintA: [UInt]
    let uint8A: [UInt8]
    let uint16A: [UInt16]
    let uint32A: [UInt32]
    let uint64A: [UInt64]

    let uintAOpt: [UInt]?
    let uint8AOpt: [UInt8]?
    let uint16AOpt: [UInt16]?
    let uint32AOpt: [UInt32]?
    let uint64AOpt: [UInt64]?

    let uintAOptNil: [UInt]?
    let uint8AOptNil: [UInt8]?
    let uint16AOptNil: [UInt16]?
    let uint32AOptNil: [UInt32]?
    let uint64AOptNil: [UInt64]?

    init(uintA: [UInt], uint8A: [UInt8], uint16A: [UInt16], uint32A: [UInt32], uint64A: [UInt64],
        uintAOpt: [UInt]?, uint8AOpt: [UInt8]?, uint16AOpt: [UInt16]?, uint32AOpt: [UInt32]?,
        uint64AOpt: [UInt64]?, uintAOptNil: [UInt]?, uint8AOptNil: [UInt8]?, uint16AOptNil: [UInt16]?,
        uint32AOptNil: [UInt32]?, uint64AOptNil: [UInt64]?) {
            self.uintA = uintA
            self.uint8A = uint8A
            self.uint16A = uint16A
            self.uint32A = uint32A
            self.uint64A = uint64A

            self.uintAOpt = uintAOpt
            self.uint8AOpt = uint8AOpt
            self.uint16AOpt = uint16AOpt
            self.uint32AOpt = uint32AOpt
            self.uint64AOpt = uint64AOpt

            self.uintAOptNil = uintAOptNil
            self.uint8AOptNil = uint8AOptNil
            self.uint16AOptNil = uint16AOptNil
            self.uint32AOptNil = uint32AOptNil
            self.uint64AOptNil = uint64AOptNil
    }

    required init?(_ decoder: Decoder) {
        // Because all of our properties are constants and haven't been initialized yet
        // the <-- infix operator won't work here, so we'll use the methods on the
        // decoder to get our values
        
        uintA = decoder.unsignedIntegerArray("uintA") ?? []
        uint8A = decoder.unsignedIntegerArray("uint8A") ?? []
        uint16A = decoder.unsignedIntegerArray("uint16A") ?? []
        uint32A = decoder.unsignedIntegerArray("uint32A") ?? []
        uint64A = decoder.unsignedIntegerArray("uint64A") ?? []

        uintAOpt = decoder.unsignedIntegerArray("uintAOpt")
        uint8AOpt = decoder.unsignedIntegerArray("uint8AOpt")
        uint16AOpt = decoder.unsignedIntegerArray("uint16AOpt")
        uint32AOpt = decoder.unsignedIntegerArray("uint32AOpt")
        uint64AOpt = decoder.unsignedIntegerArray("uint64AOpt")

        uintAOptNil = decoder.unsignedIntegerArray("uintAOptNil")
        uint8AOptNil = decoder.unsignedIntegerArray("uint8AOptNil")
        uint16AOptNil = decoder.unsignedIntegerArray("uint16AOptNil")
        uint32AOptNil = decoder.unsignedIntegerArray("uint32AOptNil")
        uint64AOptNil = decoder.unsignedIntegerArray("uint64AOptNil")
    }

    func encode(encoder: Encoder) {
        uintA     --> encoder["uintA"]
        uint8A    --> encoder["uint8A"]
        uint16A   --> encoder["uint16A"]
        uint32A   --> encoder["uint32A"]
        uint64A   --> encoder["uint64A"]

        uintAOpt     --> encoder["uintAOpt"]
        uint8AOpt    --> encoder["uint8AOpt"]
        uint16AOpt   --> encoder["uint16AOpt"]
        uint32AOpt   --> encoder["uint32AOpt"]
        uint64AOpt   --> encoder["uint64AOpt"]

        uintAOptNil     --> encoder["uintAOptNil"]
        uint8AOptNil    --> encoder["uint8AOptNil"]
        uint16AOptNil   --> encoder["uint16AOptNil"]
        uint32AOptNil   --> encoder["uint32AOptNil"]
        uint64AOptNil   --> encoder["uint64AOptNil"]
    }
}
