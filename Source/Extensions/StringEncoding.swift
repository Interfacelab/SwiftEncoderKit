//
//  BasicTypesExtension.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

protocol StringEncoding {}

// MARK: String

func --> (left:String, right: Encoder) {
    right.addString(left)
}

func <-- (inout left:String, right: Decoder) {
    guard let rightValue = right.string() else {
        return
    }

    left = rightValue
}

// MARK: String Optional

func --> (left:String?, right: Encoder) {
    right.addString(left)
}

func <-- (inout left:String?, right: Decoder) {
    guard let rightValue = right.string() else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: String arrays

func --> (left:Array<String>, right: Encoder) {
    right.addStringArray(left)
}

func <-- (inout left:Array<String>, right: Decoder) {
    guard let rightValue = right.stringArray() else {
        return
    }

    left = rightValue
}

// MARK: Optional String arrays

func --> (left:Array<String>?, right: Encoder) {
    right.addStringArray(left)
}

func <-- (inout left:Array<String>?, right: Decoder) {
    guard let rightValue = right.stringArray() else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Encoder

extension Encoder : StringEncoding {
    func addString(string: String?) {
        if string != nil {
            setValueForCurrentKey(string)
        } else {
            setValueForCurrentKey(nil)
        }
    }

    func addStringArray(doubleArray: Array<String>?) {
        guard let array = doubleArray else {
            setValueForCurrentKey(nil)
            return
        }

        setValueForCurrentKey(array)
    }
}

// MARK: Decoder

extension Decoder : StringEncoding {
    func string() -> String? {
        guard let val = valueForCurrentKey() as? String else {
            return nil
        }

        return val
    }

    func stringArray() -> Array<String>? {
        guard let val = valueForCurrentKey() as? Array<String> else {
            return nil
        }


        return val
    }
    
    func string(key: String) -> String? {
        guard let val = valueForKey(key) as? String else {
            return nil
        }
        
        return val
    }
    
    func stringArray(key: String) -> Array<String>? {
        guard let val = valueForKey(key) as? Array<String> else {
            return nil
        }
        
        
        return val
    }
    
}