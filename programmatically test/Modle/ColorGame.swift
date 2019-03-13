
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
        
        var red = CGFloat.random(in: 1...255) / 255
        var green = CGFloat.random(in: 1...255) / 255
        var blue = CGFloat.random(in: 1...255) / 255
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        self.topic = color
        self.answer = color
        // append 答案
        var colorOptions = [UIColor]()
        colorOptions.append(color)
        self.buttonCounts = Int.random(in: 4...6)
        // 設定button隨機2-6個
        for _ in 0..<self.buttonCounts {
//            let newColor = UIColor(red: CGFloat(red + (CGFloat.random(in: 0...1).turnPlusAndMinus() * CGFloat.random(in: 1...10))/255), green: CGFloat(green + (CGFloat.random(in: 0...1).turnPlusAndMinus() * CGFloat.random(in: 1...10))/255), blue: CGFloat(blue + (CGFloat.random(in: 0...1).turnPlusAndMinus() * CGFloat.random(in: 1...10))/255), alpha: 1)
            let redColor = red * CGFloat.random(in: 0.8...1)
            let greenColor = green * CGFloat.random(in: 0.8...1)
            let blueColor = blue * CGFloat.random(in: 0.8...1)
            let newColor = UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1)
            colorOptions.append(newColor)
        }
        self.options = colorOptions.shuffled()
        print(options)
    }
}

