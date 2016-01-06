//
//  TestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//

class UnsignedIntegerArrayModel: Encodable {
    var uintA: [UInt] = []
    var uint8A: [UInt8] = []
    var uint16A: [UInt16] = []
    var uint32A: [UInt32] = []
    var uint64A: [UInt64] = []

    var uintAOpt: [UInt]?
    var uint8AOpt: [UInt8]?
    var uint16AOpt: [UInt16]?
    var uint32AOpt: [UInt32]?
    var uint64AOpt: [UInt64]?

    var uintAOptNil: [UInt]? = [1,2,3,4]
    var uint8AOptNil: [UInt8]? = [1,2,3,4]
    var uint16AOptNil: [UInt16]? = [1,2,3,4]
    var uint32AOptNil: [UInt32]? = [1,2,3,4]
    var uint64AOptNil: [UInt64]? = [1,2,3,4]

    init() {

    }

    required init?(_ decoder: Decoder) {
        uintA     <-- decoder["uintA"]
        uint8A    <-- decoder["uint8A"]
        uint16A   <-- decoder["uint16A"]
        uint32A   <-- decoder["uint32A"]
        uint64A   <-- decoder["uint64A"]

        uintAOpt     <-- decoder["uintAOpt"]
        uint8AOpt    <-- decoder["uint8AOpt"]
        uint16AOpt   <-- decoder["uint16AOpt"]
        uint32AOpt   <-- decoder["uint32AOpt"]
        uint64AOpt   <-- decoder["uint64AOpt"]

        uintAOptNil     <-- decoder["uintAOptNil"]
        uint8AOptNil    <-- decoder["uint8AOptNil"]
        uint16AOptNil   <-- decoder["uint16AOptNil"]
        uint32AOptNil   <-- decoder["uint32AOptNil"]
        uint64AOptNil   <-- decoder["uint64AOptNil"]
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
