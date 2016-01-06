//
//  TestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//

class ConstSignedIntegerModel: Encodable {
    let int: Int
    let int8: Int8
    let int16: Int16
    let int32: Int32
    let int64: Int64

    let intOpt: Int?
    let int8Opt: Int8?
    let int16Opt: Int16?
    let int32Opt: Int32?
    let int64Opt: Int64?

    let intOptNil: Int?
    let int8OptNil: Int8?
    let int16OptNil: Int16?
    let int32OptNil: Int32?
    let int64OptNil: Int64?

    init(int: Int, int8: Int8, int16: Int16, int32: Int32, int64: Int64, intOpt: Int?,
        int8Opt: Int8?, int16Opt: Int16?, int32Opt: Int32?, int64Opt: Int64?, intOptNil: Int?,
        int8OptNil: Int8?, int16OptNil: Int16?, int32OptNil: Int32?, int64OptNil: Int64?) {
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
        
        int = decoder.integer("int") ?? 0
        int8 = decoder.integer("int8") ?? 0
        int16 = decoder.integer("int16") ?? 0
        int32 = decoder.integer("int32") ?? 0
        int64 = decoder.integer("int64") ?? 0

        intOpt = decoder.integer("intOpt")
        int8Opt = decoder.integer("int8Opt")
        int16Opt = decoder.integer("int16Opt")
        int32Opt = decoder.integer("int32Opt")
        int64Opt = decoder.integer("int64Opt")

        intOptNil = decoder.integer("intOptNil")
        int8OptNil = decoder.integer("int8OptNil")
        int16OptNil = decoder.integer("int16OptNil")
        int32OptNil = decoder.integer("int32OptNil")
        int64OptNil = decoder.integer("int64OptNil")
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
