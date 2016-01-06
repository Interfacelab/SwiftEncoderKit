//
//  TestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//

class ConstSignedIntegerDictionaryModel: Encodable {
    let int: [String: Int]
    let int8: [String: Int8]
    let int16: [String: Int16]
    let int32: [String: Int32]
    let int64: [String: Int64]

    let intOpt: [String: Int]?
    let int8Opt: [String: Int8]?
    let int16Opt: [String: Int16]?
    let int32Opt: [String: Int32]?
    let int64Opt: [String: Int64]?

    let intOptNil: [String: Int]?
    let int8OptNil: [String: Int8]?
    let int16OptNil: [String: Int16]?
    let int32OptNil: [String: Int32]?
    let int64OptNil: [String: Int64]?

    init(int: [String: Int], int8: [String: Int8], int16: [String: Int16], int32: [String: Int32],
        int64: [String: Int64], intOpt: [String: Int]?, int8Opt: [String: Int8]?,
        int16Opt: [String: Int16]?, int32Opt: [String: Int32]?, int64Opt: [String: Int64]?,
        intOptNil: [String: Int]?, int8OptNil: [String: Int8]?, int16OptNil: [String: Int16]?,
        int32OptNil: [String: Int32]?, int64OptNil: [String: Int64]?) {
            self.int = int
            self.int8 = int8
            self.int16 = int16
            self.int32 = int32
            self.int64 = int64

            self.intOpt = intOpt
            self.int8Opt = int8Opt
            self.int16Opt = int16Opt
            self.int32Opt = int32Opt
            self.int64Opt = int64Opt

            self.intOptNil = intOptNil
            self.int8OptNil = int8OptNil
            self.int16OptNil = int16OptNil
            self.int32OptNil = int32OptNil
            self.int64OptNil = int64OptNil
    }

    required init?(_ decoder: Decoder) {
        // Because all of our properties are constants and haven't been initialized yet
        // the <-- infix operator won't work here, so we'll use the methods on the
        // decoder to get our values

        int = decoder.integerDictionary("int") ?? [:]
        int8 = decoder.integerDictionary("int8") ?? [:]
        int16 = decoder.integerDictionary("int16") ?? [:]
        int32 = decoder.integerDictionary("int32") ?? [:]
        int64 = decoder.integerDictionary("int64") ?? [:]

        intOpt = decoder.integerDictionary("intOpt")
        int8Opt = decoder.integerDictionary("int8Opt")
        int16Opt = decoder.integerDictionary("int16Opt")
        int32Opt = decoder.integerDictionary("int32Opt")
        int64Opt = decoder.integerDictionary("int64Opt")

        intOptNil = decoder.integerDictionary("intOptNil")
        int8OptNil = decoder.integerDictionary("int8OptNil")
        int16OptNil = decoder.integerDictionary("int16OptNil")
        int32OptNil = decoder.integerDictionary("int32OptNil")
        int64OptNil = decoder.integerDictionary("int64OptNil")

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
    }
}
