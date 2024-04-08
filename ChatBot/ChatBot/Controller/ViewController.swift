//
//  ViewController.swift
//  ChatBot
//
//  Created by Tacocat on 1/1/24.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try NetworkProcess().requestNetwork(query: "String") { (response, error) in
                if let response = response {
                    print(response)
                } else {
                    print("Response nil")
                }
            }
            
        } catch {
            print(NetworkError.failedResponse)
        }
    }
}
