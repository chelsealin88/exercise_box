
//
//  ColorImage.swift
//  programmatically test
//
//  Created by chelsea lin on 2019/3/6.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import Foundation
import UIKit

//extension UIColor {
//    class func makeColor(from game:ColorGame)->UIColor{
//        let red = game.theColorCode.0
//        return UIColor(red: red, green: red, blue: red, alpha: 1)
//    }
//    func makeColorLooksalike(offest:Int)->UIColor{
//
//    }
//}

struct ColorGame {
    let topic: UIColor
    let options: [UIColor]
    let answer: UIColor
    let buttonCounts: Int
//    let theColorCode : (CGFloat,CGFloat,CGFloat)
//    var theAnswerColer:UIColor {
//        return UIColor(red: theColorCode.0, green: theColorCode.1, blue: theColorCode.2, alpha: 1)
//    }
//    var options_:[UIColor] {
//        let red = theColorCode.0, green = theColorCode.1, blue = theColorCode.2
//        var colorOptions = [UIColor]()
//         let color = UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
//        colorOptions.append(color)
//        for _ in 0..<buttonCounts {
//            let newColor = UIColor(red: CGFloat(red + (CGFloat.random(in: 0...1).turnPlusAndMinus() * CGFloat.random(in: 1...10))/255), green: CGFloat(green + (CGFloat.random(in: 0...1).turnPlusAndMinus() * CGFloat.random(in: 1...10))/255), blue: CGFloat(blue + (CGFloat.random(in: 0...1).turnPlusAndMinus() * CGFloat.random(in: 1...10))/255), alpha: 1)
//            colorOptions.append(newColor)
//        }
//        return colorOptions
//    }
    
    
    init(red: CGFloat, green: CGFloat, blue: CGFloat){
//        self.theColorCode = (red, green, blue)
        
        let color = UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
        self.topic = color
        self.answer = color
        var colorOptions = [UIColor]()
        colorOptions.append(color)
        self.buttonCounts = Int.random(in: 4...5)
        // 設定button隨機2-6個
        for _ in 0..<self.buttonCounts {
//            let newColor = UIColor(red: CGFloat(red + (CGFloat.random(in: 0...1).turnPlusAndMinus() * CGFloat.random(in: 1...10))/255), green: CGFloat(green + (CGFloat.random(in: 0...1).turnPlusAndMinus() * CGFloat.random(in: 1...10))/255), blue: CGFloat(blue + (CGFloat.random(in: 0...1).turnPlusAndMinus() * CGFloat.random(in: 1...10))/255), alpha: 1)
            let redColor = red * CGFloat.random(in: 0.99...1.03) / 255.0
            let greenColor = green * CGFloat.random(in: 0.99...1.03) / 255.0
            let blueColor = blue * CGFloat.random(in: 0.99...1.03) / 255.0
            let newColor = UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1)
            colorOptions.append(newColor)
        }
        self.options = colorOptions.shuffled()
        print(options)
    }
}

// MARK: 防止RGB會random出0
extension CGFloat {
    func turnPlusAndMinus() -> CGFloat {
        if self == 0 {
            return  -1
        } else {
            return  1
        }
    }
}

