//
//  Message.swift
//  ChatBot
//
//  Created by 둘리 on 4/7/24.
//

import Foundation

struct Message: Codable {
    var role: Role
    var content: String
}

enum Role: String, Codable {
    case system
    case user
    case assistant
}
