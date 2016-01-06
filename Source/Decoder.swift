//
//  Decoder.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/1/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

infix operator <-- { }

class Decoder {
    private var _currentKey: String?
    private let _data:[String: AnyObject]

    init(path: String) {
        if let root = NSKeyedUnarchiver.unarchiveObjectWithFile(path) {
            _data = root as! [String: AnyObject]
        } else {
            _data = [:]
        }
    }

    init(dict: [String: AnyObject]) {
        _data = dict
    }

    subscript(key: String) -> Decoder {
        _currentKey = key
        return self
    }

    func valueForCurrentKey() -> AnyObject? {
        guard let key = _currentKey, let val = _data[key] else {
            return nil
        }

        return val
    }

    func valueForKey(key: String) -> AnyObject? {
        guard let val = _data[key] else {
            return nil
        }

        return val
    }
}