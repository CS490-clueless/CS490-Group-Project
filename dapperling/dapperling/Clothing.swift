//
//  Post.swift
//  lab-insta-parse
//
//  Created by Charlie Hieger on 11/29/22.
//

import Foundation
import ParseSwift
// TODO: Pt 1 - Import Parse Swift

// TODO: Pt 1 - Create Post Parse Object model
// https://github.com/parse-community/Parse-Swift/blob/3d4bb13acd7496a49b259e541928ad493219d363/ParseSwift.playground/Pages/1%20-%20Your%20first%20Object.xcplaygroundpage/Contents.swift#L33

struct Clothing: ParseObject {
    // These are required by ParseObject
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?

    // Your own custom properties.
    var store: String?
    var price: String?
    var date: String?
    var type: String?
    var user: String?
    var imageFile: ParseFile?
    
}
