//
//  NetworkProcess.swift
//  ChatBot
//
//  Created by 둘리 on 4/8/24.
//

import Foundation

struct NetworkProcess {
    func requestNetwork(query: String, completion: @escaping ((GPTResponseDTO?, NetworkError?) -> Void)) throws {
        
        guard let url = URL(string: "https://api.openai.com/v1/chat/completions") else {
            print("유효하지 않은 URL입니다.")
            return
        }
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = ["Content-Type" : "application/json", "Authorization" : "Bearer"]
        
        let body = GPTRequestDTO(model: GPTVersion.basic, stream: false, messages: [Message(role: Role.user, content: "저녁메뉴 추천해줘")])
        
        request.httpBody = try JSONEncoder().encode(body)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                completion(nil, .failedRequest)
                return
            }
            
            guard let data = data else {
                completion(nil, .invalidData)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(nil, .responseError)
                return
            }
            
            guard response.statusCode == 200 else {
                completion(nil,.failedRequest)
                return
            }
            
            do {
                let result = try JSONDecoder().decode(GPTResponseDTO.self, from: data)
                completion(result, nil)
                print("파싱완료.")
            } catch {
                print("파싱실패.")
                completion(nil, .invalidData)
            }
        }
        task.resume()
    }
}
