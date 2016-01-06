//
//  TestModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 12/13/15.
//  Copyright © 2015 Interfacelab LLC. All rights reserved.
//

class ConstSignedIntegerArrayModel: Encodable {
    let intA: [Int]
    let int8A: [Int8]
    let int16A: [Int16]
    let int32A: [Int32]
    let int64A: [Int64]

    let intAOpt: [Int]?
    let int8AOpt: [Int8]?
    let int16AOpt: [Int16]?
    let int32AOpt: [Int32]?
    let int64AOpt: [Int64]?

    let intAOptNil: [Int]?
    let int8AOptNil: [Int8]?
    let int16AOptNil: [Int16]?
    let int32AOptNil: [Int32]?
    let int64AOptNil: [Int64]?

    init(intA: [Int], int8A: [Int8], int16A: [Int16], int32A: [Int32], int64A: [Int64],
        intAOpt: [Int]?, int8AOpt: [Int8]?, int16AOpt: [Int16]?, int32AOpt: [Int32]?,
        int64AOpt: [Int64]?, intAOptNil: [Int]?, int8AOptNil: [Int8]?, int16AOptNil: [Int16]?,
        int32AOptNil: [Int32]?, int64AOptNil: [Int64]?) {
            self.intA = intA
            self.int8A = int8A
            self.int16A = int16A
            self.int32A = int32A
            self.int64A = int64A

            self.intAOpt = intAOpt
            self.int8AOpt = int8AOpt
            self.int16AOpt = int16AOpt
            self.int32AOpt = int32AOpt
            self.int64AOpt = int64AOpt

            self.intAOptNil = intAOptNil
            self.int8AOptNil = int8AOptNil
            self.int16AOptNil = int16AOptNil
            self.int32AOptNil = int32AOptNil
            self.int64AOptNil = int64AOptNil
    }

    required init?(_ decoder: Decoder) {
        // Because all of our properties are constants and haven't been initialized yet
        // the <-- infix operator won't work here, so we'll use the methods on the
        // decoder to get our values
        
        intA = decoder.integerArray("intA") ?? []
        int8A = decoder.integerArray("int8A") ?? []
        int16A = decoder.integerArray("int16A") ?? []
        int32A = decoder.integerArray("int32A") ?? []
        int64A = decoder.integerArray("int64A") ?? []

        intAOpt = decoder.integerArray("intAOpt")
        int8AOpt = decoder.integerArray("int8AOpt")
        int16AOpt = decoder.integerArray("int16AOpt")
        int32AOpt = decoder.integerArray("int32AOpt")
        int64AOpt = decoder.integerArray("int64AOpt")

        intAOptNil = decoder.integerArray("intAOptNil")
        int8AOptNil = decoder.integerArray("int8AOptNil")
        int16AOptNil = decoder.integerArray("int16AOptNil")
        int32AOptNil = decoder.integerArray("int32AOptNil")
        int64AOptNil = decoder.integerArray("int64AOptNil")

    }

    func encode(encoder: Encoder) {
        encoder.addIntegerArray(intA, key: "intA")
        encoder.addIntegerArray(int8A, key: "int8A")
        encoder.addIntegerArray(int16A, key: "int16A")
        encoder.addIntegerArray(int32A, key: "int32A")
        encoder.addIntegerArray(int64A, key: "int64A")

        encoder.addIntegerArray(intAOpt, key: "intAOpt")
        encoder.addIntegerArray(int8AOpt, key: "int8AOpt")
        encoder.addIntegerArray(int16AOpt, key: "int16AOpt")
        encoder.addIntegerArray(int32AOpt, key: "int32AOpt")
        encoder.addIntegerArray(int64AOpt, key: "int64AOpt")
        
        encoder.addIntegerArray(intAOptNil, key: "intAOptNil")
        encoder.addIntegerArray(int8AOptNil, key: "int8AOptNil")
        encoder.addIntegerArray(int16AOptNil, key: "int16AOptNil")
        encoder.addIntegerArray(int32AOptNil, key: "int32AOptNil")
        encoder.addIntegerArray(int64AOptNil, key: "int64AOptNil")
    }
}
