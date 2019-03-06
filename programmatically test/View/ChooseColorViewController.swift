//
//  ChooseColorViewController.swift
//  programmatically test
//
//  Created by chelsea lin on 2019/3/5.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import UIKit

class ChooseColorViewController: UIViewController {
    
    var games = [ColorGame]()
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Choose Kolor"
        view.backgroundColor = .white
        titleLabel()
        createGames()
        makeImageViews(topic: "q1", options: games[0].options)
        print(games[0].options)
    }
    
    
    func titleLabel() {
        
        var label = UILabel(frame: CGRect(x: 110, y: 60, width: 200, height: 100))
        label.textAlignment = .center
        label.text = "What Kolor is this?"
        label.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(label)
        
    }
    
    func createGames() {
        let game1 = ColorGame(topic: "q1", answer: 3)
        games.append(game1)
    }
    
    func makeImageViews(topic: String ,options: [String]) {
        
        var topicimage : UIImageView
        topicimage = UIImageView(frame: CGRect(x: 0, y: 150, width: 500 , height: 300))
        topicimage.image = UIImage(named: "q1")
        view.addSubview(topicimage)
        
        for index in options.indices {
            let button = UIButton()
            let width = Int(view.bounds.width) / options.count
            button.frame = CGRect(x: index * width, y: 550, width: width, height: width)
            let buttonimage = UIImage(named: options[index])
            button.setImage(buttonimage, for: .normal)
            button.tag = index
            //            button.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
            //            buttons.append(<#T##newElement: UIButton##UIButton#>)
            view.addSubview(button)
        }
        
    }
    
}





/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */



