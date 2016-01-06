//
//  CGVectorModel.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/5/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import QuartzCore

class ConstCGVectorModel: Encodable {
    let vector: CGVector
    let vectorOpt: CGVector?
    let vectorOptNil: CGVector?

    let vectorA: [CGVector]
    let vectorOptA: [CGVector]?
    let vectorOptNilA: [CGVector]?

    let vectorD: [String: CGVector]
    let vectorOptD: [String: CGVector]?
    let vectorOptNilD: [String: CGVector]?

    init(vector: CGVector,
        vectorOpt: CGVector?,
        vectorOptNil: CGVector?,
        vectorA: [CGVector],
        vectorOptA: [CGVector]?,
        vectorOptNilA: [CGVector]?,
        vectorD: [String: CGVector],
        vectorOptD: [String: CGVector]?,
        vectorOptNilD: [String: CGVector]?) {
            self.vector = vector
            self.vectorOpt = vectorOpt
            self.vectorOptNil = vectorOptNil
            self.vectorA = vectorA
            self.vectorOptA = vectorOptA
            self.vectorOptNilA = vectorOptNilA
            self.vectorD = vectorD
            self.vectorOptD = vectorOptD
            self.vectorOptNilD = vectorOptNilD
    }

    required init?(_ decoder: Decoder) {
        vector = decoder.encodable("vector")!
        vectorOpt = decoder.encodable("vectorOpt")
        vectorOptNil = decoder.encodable("vectorOptNil")

        vectorA = decoder.encodableArray("vectorA")!
        vectorOptA = decoder.encodableArray("vectorOptA")
        vectorOptNilA = decoder.encodableArray("vectorOptNilA")

        vectorD = decoder.encodableDictionary("vectorD")!
        vectorOptD = decoder.encodableDictionary("vectorOptD")
        vectorOptNilD = decoder.encodableDictionary("vectorOptNilD")
    }

    func encode(encoder: Encoder) {
        encoder.addEncodable(vector, key: "vector")
        encoder.addEncodable(vectorOpt, key: "vectorOpt")
        encoder.addEncodable(vectorOptNil, key: "vectorOptNil")

        encoder.addEncodableArray(vectorA, key: "vectorA")
        encoder.addEncodableArray(vectorOptA, key: "vectorOptA")
        encoder.addEncodableArray(vectorOptNilA, key: "vectorOptNilA")
        
        encoder.addEncodableDictionary(vectorD, key: "vectorD")
        encoder.addEncodableDictionary(vectorOptD, key: "vectorOptD")
        encoder.addEncodableDictionary(vectorOptNilD, key: "vectorOptNilD")
    }
    
}