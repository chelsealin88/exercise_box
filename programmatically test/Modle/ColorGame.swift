
//
//  ColorImage.swift
//  programmatically test
//
//  Created by chelsea lin on 2019/3/6.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import Foundation


struct ColorGame {
    
    let topic: String
    var options: [String]
    let answer: String
    
    init(topic: String, answer: Int) {
        self.topic = topic
        var options = [String]()
        for number in 1...4 {
            options.append("\(topic)-\(number)")
        }
        self.options = options
        self.answer = options[answer]
    }

}
