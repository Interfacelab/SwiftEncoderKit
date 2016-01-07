SwiftEncoderKit
===============
[![Build Status](https://travis-ci.org/Interfacelab/SwiftEncoderKit.svg?branch=master)](https://travis-ci.org/Hearst-DD/ObjectMapper)

Serializing and deserializing object graphs in Swift boils down to four options: using JSON via ObjectMapper or similar, using CoreData, using NSKeyedArchiver via NSCoding and a whole lot of boilerplate code, or writing your own serialization/deserialization framework.

SwiftEncoderKit "wraps" NSKeyedArchiver and adds the ability to encode Swift structs and enums - as well as encoding all of the basic types, NSCoding compliant classes and commonly used C structs (CGPoint, CGRect, etc.).


# Basic Usage

To encode a class or struct, you simply need to implement the `Encodable` protocol, which is eerily similar to the `NSCoding` protocol:


```swift
class EncodableModel: Encodable {
    var rect: CGRect = CGRect.zero
    var rotation: Float = 0.0
    var previewImage: UIImage!
    var animationTimes: [CMTime] = []

    init() {
        previewImage = UIImage(named: "test.png")
    }

    required init?(_ decoder: Decoder) {
        rect <-- decoder["rect"]
        rotation <-- decoder["rotation"]
        previewImage <-- decoder["previewImage"]
        animationTimes <-- decoder["animationTimes"]
    }

    func encode(encoder: Encoder) {
        rect --> encoder["rect"]
        rotation --> encoder["rotation"]
        previewImage --> encoder["previewImage"]
        animationTimes --> encoder["animationTimes"]
    }
}
```

To encode the model to file:

```swift
let model = EncodableModel()
Encoder(model).writeToFile("somefile.plist")
```

To decode the model:

```swift
let model: EncodableModel? = Decoder("somefile.plist").decodedObject()
```


# Supported Types

SwiftEncoderKit supports encoding the following types out of the box:

- Int (Int, Int8, Int16, Int32, Int64)
- UInt (UInt, UInt8 UInt16, UInt32, UInt64)
- String
- Bool
- Float
- Double
- Any object conforming to `NSCoding` protocol (UIColor, UIImage, NSData, etc)
- Any object conforming to `Encodable` protocol
- Typed enums
- CGRect, CGPoint, CGSize, CGVector, CGAffineTransform, CATransform3D
- CMTime, CMTimeRange, CMTimeMapping
- Arrays of the above
- Dictionaries of the above
- Optionals and implicitly unwrapped optionals of the above (including Arrays and Dictionaries)



