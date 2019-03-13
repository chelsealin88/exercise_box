
//
//  ColorImage.swift
//  programmatically test
//
//  Created by chelsea lin on 2019/3/6.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import Foundation
import UIKit

struct ColorGame {
    let topic: UIColor
    let options: [UIColor]
    let answer: UIColor
    let buttonCounts: Int

    init(){
        
        var colorOptions = [UIColor]()
        
        // append 答案
        let red = CGFloat.random(in: 1...255) / 255
        let green = CGFloat.random(in: 1...255) / 255
        let blue = CGFloat.random(in: 1...255) / 255
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        self.topic = color
        self.answer = color
        colorOptions.append(color)
        
        // 設定 color 隨機
        let buttonCount = Int.random(in: 1...4)
        for _ in 0...buttonCount {
            let redColor = red * CGFloat.random(in: 0.8...1)
            let greenColor = green * CGFloat.random(in: 0.8...1)
            let blueColor = blue * CGFloat.random(in: 0.8...1)
            let newColor = UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1)
            colorOptions.append(newColor)
        }
        self.options = colorOptions.shuffled()
        self.buttonCounts = self.options.count
        print("數量", self.buttonCounts)
    }
}

