//
//  Encodable.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/1/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

protocol Encodable {
    init?(_ decoder: Decoder)
    func encode(encoder: Encoder)
}