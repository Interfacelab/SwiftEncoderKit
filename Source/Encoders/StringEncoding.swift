//
//  BasicTypesExtension.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

protocol StringEncoding {}

// MARK: Encoder

extension Encoder : StringEncoding {
    func addString(string: String?, key: String?) {
        if key == nil {
            setValueForCurrentKey(string)
        }
        else {
            setValue(key!, value: string)
        }
    }

    func addStringArray(stringArray: Array<String>?, key: String?) {
        if key == nil {
            setValueForCurrentKey(stringArray)
        }
        else {
            setValue(key!, value: stringArray)
        }
    }

    func addStringDictionary(stringDict: [String: String]?, key: String?) {
        if key == nil {
            setValueForCurrentKey(stringDict)
        } else {
            setValue(key!, value: stringDict)
        }
    }
}

// MARK: Decoder

extension Decoder : StringEncoding {
    func string(key: String?) -> String? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? String
    }

    func stringArray(key: String?) -> Array<String>? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? Array<String>
    }

    func stringDictionary(key: String?) -> [String: String]? {
        return ((key == nil) ? valueForCurrentKey() : valueForKey(key!)) as? [String: String]
    }
}