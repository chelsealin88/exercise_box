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
        //        print(games[0].options)
    }
    
    // MARK: - 標題
    func titleLabel() {
        
        var label = UILabel(frame: CGRect(x: 110, y: 60, width: 200, height: 100))
        label.textAlignment = .center
        label.text = "What Kolor is this?"
        label.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(label)
        
    }
    
    // MARK: - 產生每一局遊戲
    func createGames() {
        let game1 = ColorGame(topic: "q1", answer: 3)
        let game2 = ColorGame(topic: "q2", answer: 3)
        let game3 = ColorGame(topic: "q3", answer: 3)
        games.append(game1)
        games.append(game2)
        games.append(game3)
    }
    
    // MARK: - 製作題目
    func makeImageViews(topic: String ,options: [String]) {
        
        var topicimage : UIImageView
        topicimage = UIImageView(frame: CGRect(x: 0, y: 150, width: 500 , height: 300))
        topicimage.image = UIImage(named: "q1")
        
        view.addSubview(topicimage)
        
        let suffledOptions = options.shuffled()
        for index in suffledOptions.indices {
            let button = UIButton()
            let width = Int(view.bounds.width) / suffledOptions.count
            button.frame = CGRect(x: index * width, y: 550, width: width, height: width)
            let buttonimage = UIImage(named: suffledOptions[index])
            button.setImage(buttonimage, for: .normal)
            button.setTitle(suffledOptions[index], for: .normal)
            button.setTitleColor(.clear, for: .normal)
            button.tag = index
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            //            #if DEBUG
            //            print("index:",suffledOptions[index])
            //            #endif
            view.addSubview(button)
        }
        
    }
    
    @objc func buttonAction(_ sender: UIButton){
        
        if let title = sender.currentTitle {
            let index = title.index(before: title.endIndex)
            let answer = title[index]
            let character: Character = "4"
            if character == answer {
                
                let alert = UIAlertController(title: "Bingo", message: "", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "Go to next game", style: UIAlertAction.Style.default) { (result : UIAlertAction) -> Void in
                    
                    //                    self.makeImageViews(topic: "q2", options: self.games[1].options)
                    let vc = PlusNumberViewController()
                    self.navigationController?.pushViewController(vc, animated: true)
                }
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
                
            } else { // Wrong Ans
                
                let alert = UIAlertController(title: "有障礙？", message: "", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "再玩一次", style: UIAlertAction.Style.default) { (result : UIAlertAction) -> Void in
                    
                }
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
        
    }
    
}


