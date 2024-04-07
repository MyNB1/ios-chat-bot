//
//  GPTResponseDTO.swift
//  ChatBot
//
//  Created by 둘리 on 4/7/24.
//

import Foundation

struct GPTResponseDTO: Codable {
    let id: String
    let object: String
    let created: Int
    let model: String
    let systemFingerprint: String
    let choices: [Choice]
    let usage: Usage

    enum CodingKeys: String, CodingKey {
        case id, object, created, model
        case systemFingerprint = "system_fingerprint"
        case choices, usage
    }
}

struct Choice: Codable {
    let index: Int
    let message: Message
    let logprobs: String?
    let finishReason: String
    
    enum CodingKeys: String, CodingKey {
        case index, message, logprobs
        case finishReason = "finish_reason"
    }
}

struct Usage: Codable {
    let promptTokens: Int
    let completionTokens: Int
    let totalTokens: Int
    
    enum CodingKeys: String, CodingKey {
        case promptTokens = "prompt_tokens"
        case completionTokens = "completion_tokens"
        case totalTokens = "total_tokens"
    }
}
