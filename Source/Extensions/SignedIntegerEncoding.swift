//
//  BasicTypesExtension.swift
//  ShaveiOS
//
//  Created by Jon Gilkison on 1/2/16.
//  Copyright © 2016 Interfacelab LLC. All rights reserved.
//

import Foundation

protocol SignedIntegerEncoding {}

// MARK: Integer values

func --> <T: SignedIntegerType>(left:T, right: Encoder) {
    right.addInteger(left)
}

func <-- <T: SignedIntegerType>(inout left:T, right: Decoder) {
    guard let rightValue: T = right.integer() else {
        return
    }

    left = rightValue
}


// MARK: Integer arrays

func --> <T: SignedIntegerType>(left:Array<T>, right: Encoder) {
    right.addIntegerArray(left)
}

func <-- <T: SignedIntegerType>(inout left:Array<T>, right: Decoder) {
    guard let rightValue:Array<T> = right.integerArray() else {
        return
    }

    left = rightValue
}

// MARK: Optional integer values

func --> <T: SignedIntegerType>(left:T?, right: Encoder) {
    right.addInteger(left)
}

func <-- <T: SignedIntegerType>(inout left:T?, right: Decoder) {
    guard let rightValue: T = right.integer() else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Optional integer arrays

func --> <T: SignedIntegerType>(left:Array<T>?, right: Encoder) {
    right.addIntegerArray(left)
}

func <-- <T: SignedIntegerType>(inout left:Array<T>?, right: Decoder) {
    guard let rightValue:Array<T> = right.integerArray() else {
        left = nil
        return
    }

    left = rightValue
}

// MARK: Integer dictionaries

func --> <T: SignedIntegerType>(left: [String: T], right: Encoder) {
    right.addIntegerDictionary(left)
}

func <-- <T: SignedIntegerType>(inout left: [String: T], right: Decoder) {
    guard let rightValue: [String: T] = right.integerDictionary() else {
        return
    }

    left = rightValue
}

// MARK: Optional Integer dictionaries

func --> <T: SignedIntegerType>(left: [String: T]?, right: Encoder) {
    right.addIntegerDictionary(left)
}

func <-- <T: SignedIntegerType>(inout left: [String: T]?, right: Decoder) {
    guard let rightValue: [String: T] = right.integerDictionary() else {
        left = nil
        return
    }

    left = rightValue
}



extension Encoder : SignedIntegerEncoding {
    // MARK: Integer types

    func addInteger<T: SignedIntegerType>(int: T?) {
        if let x = int as? Int {
            setValueForCurrentKey(NSNumber(integer: x))
        } else if let x = int as? Int8 {
            setValueForCurrentKey(NSNumber(char: x))
        } else if let x = int as? Int16 {
            setValueForCurrentKey(NSNumber(short: x))
        } else if let x = int as? Int32 {
            setValueForCurrentKey(NSNumber(int: x))
        } else if let x = int as? Int64 {
            setValueForCurrentKey(NSNumber(longLong: x))
        } else {
            setValueForCurrentKey(nil)
        }
    }

    func addIntegerArray<T: SignedIntegerType>(integerArray: Array<T>?) {
        guard let array = integerArray else {
            setValueForCurrentKey(nil)
            return
        }

        var encoded:[NSNumber] = []

        for int in array {
            if let x = int as? Int {
                encoded.append(NSNumber(integer: x))
            } else if let x = int as? Int8 {
                encoded.append(NSNumber(char: x))
            } else if let x = int as? Int16 {
                encoded.append(NSNumber(short: x))
            } else if let x = int as? Int32 {
                encoded.append(NSNumber(int: x))
            } else if let x = int as? Int64 {
                encoded.append(NSNumber(longLong: x))
            }
        }

        setValueForCurrentKey(encoded)
    }

    func addIntegerDictionary<T: SignedIntegerType>(integerDict: [String: T]?) {
        guard let dict = integerDict else {
            setValueForCurrentKey(nil)
            return
        }

        var encoded:[String: NSNumber] = [:]

        for (key, int) in dict {
            if let x = int as? Int {
                encoded[key] = NSNumber(integer: x)
            } else if let x = int as? Int8 {
                encoded[key] = NSNumber(char: x)
            } else if let x = int as? Int16 {
                encoded[key] = NSNumber(short: x)
            } else if let x = int as? Int32 {
                encoded[key] = NSNumber(int: x)
            } else if let x = int as? Int64 {
                encoded[key] = NSNumber(longLong: x)
            }
        }

        setValueForCurrentKey(encoded)
    }
}

extension Decoder : SignedIntegerEncoding {
    // MARK: Integer types

    func integer<T: SignedIntegerType>() -> T? {
        guard let val = valueForCurrentKey() as? NSNumber else {
            return nil
        }

        let dt=T.self

        if dt == Int.self || dt == Int?.self {
            return val.integerValue as? T
        } else if dt == Int8.self || dt == Int8?.self {
            return val.charValue as? T
        } else if dt == Int16.self || dt == Int16?.self {
            return val.shortValue as? T
        } else if dt == Int32.self || dt == Int32?.self {
            return val.intValue as? T
        } else if dt == Int64.self || dt == Int64?.self {
            return val.longLongValue as? T
        }

        return nil
    }

    func integerArray<T: SignedIntegerType>() -> Array<T>? {
        guard let val = valueForCurrentKey() as? Array<NSNumber> else {
            return nil
        }

        let dt=T.self

        var decoded: [T] = []

        for ele in val {
            if dt == Int.self || dt == Int?.self {
                decoded.append(ele.integerValue as! T)
            } else if dt == Int8.self || dt == Int8?.self {
                decoded.append(ele.charValue as! T)
            } else if dt == Int16.self || dt == Int16?.self {
                decoded.append(ele.shortValue as! T)
            } else if dt == Int32.self || dt == Int32?.self {
                decoded.append(ele.intValue as! T)
            } else if dt == Int64.self || dt == Int64?.self {
                decoded.append(ele.longLongValue as! T)
            }
        }

        return decoded
    }

    func integerDictionary<T: SignedIntegerType>() -> [String : T]? {
        guard let val = valueForCurrentKey() as? [String : NSNumber] else {
            return nil
        }

        let dt=T.self

        var decoded: [String : T] = [:]

        for (key, ele) in val {
            if dt == Int.self || dt == Int?.self {
                decoded[key] = ele.integerValue as? T
            } else if dt == Int8.self || dt == Int8?.self {
                decoded[key] = ele.charValue as? T
            } else if dt == Int16.self || dt == Int16?.self {
                decoded[key] = ele.shortValue as? T
            } else if dt == Int32.self || dt == Int32?.self {
                decoded[key] = ele.intValue as? T
            } else if dt == Int64.self || dt == Int64?.self {
                decoded[key] = ele.longLongValue as? T
            }
        }

        return decoded
    }

    func integer<T: SignedIntegerType>(key:String) -> T? {
        guard let val = valueForKey(key) as? NSNumber else {
            return nil
        }

        let dt=T.self

        if dt == Int.self || dt == Int?.self {
            return val.integerValue as? T
        } else if dt == Int8.self || dt == Int8?.self {
            return val.charValue as? T
        } else if dt == Int16.self || dt == Int16?.self {
            return val.shortValue as? T
        } else if dt == Int32.self || dt == Int32?.self {
            return val.intValue as? T
        } else if dt == Int64.self || dt == Int64?.self {
            return val.longLongValue as? T
        }

        return nil
    }

    func integerArray<T: SignedIntegerType>(key: String) -> Array<T>? {
        guard let val = valueForKey(key) as? Array<NSNumber> else {
            return nil
        }

        let dt=T.self

        var decoded: [T] = []

        for ele in val {
            if dt == Int.self || dt == Int?.self {
                decoded.append(ele.integerValue as! T)
            } else if dt == Int8.self || dt == Int8?.self {
                decoded.append(ele.charValue as! T)
            } else if dt == Int16.self || dt == Int16?.self {
                decoded.append(ele.shortValue as! T)
            } else if dt == Int32.self || dt == Int32?.self {
                decoded.append(ele.intValue as! T)
            } else if dt == Int64.self || dt == Int64?.self {
                decoded.append(ele.longLongValue as! T)
            }
        }

        return decoded
    }



    func integerDictionary<T: SignedIntegerType>(key: String) -> [String : T]? {
        guard let val = valueForKey(key) as? [String : NSNumber] else {
            return nil
        }

        let dt=T.self

        var decoded: [String : T] = [:]

        for (key, ele) in val {
            if dt == Int.self || dt == Int?.self {
                decoded[key] = ele.integerValue as? T
            } else if dt == Int8.self || dt == Int8?.self {
                decoded[key] = ele.charValue as? T
            } else if dt == Int16.self || dt == Int16?.self {
                decoded[key] = ele.shortValue as? T
            } else if dt == Int32.self || dt == Int32?.self {
                decoded[key] = ele.intValue as? T
            } else if dt == Int64.self || dt == Int64?.self {
                decoded[key] = ele.longLongValue as? T
            }
        }

        return decoded
    }
}