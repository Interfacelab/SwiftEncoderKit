//
//  OSTypes.swift
//  SwiftEncoderKit
//
//  Created by Jon Gilkison on 1/7/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//


#if os(OSX)
    import Cocoa

    typealias OSImage = NSImage
    typealias OSColor = NSColor

#else
    import UIKit

    typealias OSImage = UIImage
    typealias OSColor = UIColor
#endif
