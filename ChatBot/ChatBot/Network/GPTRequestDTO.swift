//
//  GPTRequestDTO.swift
//  ChatBot
//
//  Created by 둘리 on 4/7/24.
//

import Foundation

struct GPTRequestDTO: Codable {
    let model: GPTVersion
    let stream: Bool
    let messages: [Message]
}

enum GPTVersion: String, Codable {
    case basic = "gpt-3.5-turbo-1106"
}
