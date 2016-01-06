//
//  BasicTypesExtension.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

protocol BasicTypesEncoding {}


extension Encoder : BasicTypesEncoding {
    // MARK: Float and Double

    func addFloat(float: Float?) {
        if float != nil {
            setValueForCurrentKey(NSNumber(float: float!))
        } else {
            setValueForCurrentKey(nil)
        }
    }

    func addDouble(double: Double?) {
        if double != nil {
            setValueForCurrentKey(NSNumber(double: double!))
        } else {
            setValueForCurrentKey(nil)
        }
    }

    // MARK: Basic Types

    func addBool(bool: Bool?) {
        if bool != nil {
            setValueForCurrentKey(NSNumber(bool: bool!))
        } else {
            setValueForCurrentKey(nil)
        }
    }

    func addString(string: String?) {
        if string != nil {
            setValueForCurrentKey(string)
        } else {
            setValueForCurrentKey(nil)
        }
    }
}

extension Decoder : BasicTypesEncoding {
    // MARK: Float and Double types

    func getFloatValue() -> Float? {
        guard let val = valueForCurrentKey() as? NSNumber else {
            return nil
        }

        return val.floatValue
    }

    func getDoubleValue() -> Double? {
        guard let val = valueForCurrentKey() as? NSNumber else {
            return nil
        }

        return val.doubleValue
    }

    // MARK: Basic Types

    func getBoolValue() -> Bool? {
        guard let val = valueForCurrentKey() as? NSNumber else {
            return nil
        }

        return val.boolValue
    }

    func getStringValue() -> String? {
        guard let val = valueForCurrentKey() as? String else {
            return nil
        }

        return val
    }
}