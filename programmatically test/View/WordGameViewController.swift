//
//  WordGameViewController.swift
//  programmatically test
//
//  Created by chelsea lin on 2019/3/7.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import UIKit

class WordGameViewController: UIViewController {
    
    var games = [WordGame]()
    
    var timer: Timer?
    var totalTime = 10
    var timeLabel:UILabel = {
        let timeLabel = UILabel(frame: CGRect(x: 100, y: 130, width: 300, height: 50))
        timeLabel.font = UIFont.systemFont(ofSize: 30)
        timeLabel.text = ""
        return timeLabel
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "What dose this Word mean?"
        view.backgroundColor = .white
        
        titleLabel()
        creatGames()
        startTime()
        makeImageViews(topic: "a1", options: games[0].options)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(backAction))
        view.addSubview(self.timeLabel)
    }
    
    @objc func backAction(){
        navigationController?.popViewController(animated: true)
    }
    
    func titleLabel() {
        
        var label = UILabel(frame: CGRect(x: 0, y: 60, width: 400, height: 100))
        label.textAlignment = .center
        label.text = "請找出字面上的顏色🤔"
        label.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(label)
        
    }
    
    // MARK: - 產生每一局遊戲
    func creatGames() {
        let game1 = WordGame(topic: "a1", answer: 3)
        games.append(game1)
        
    }
    
    func makeImageViews(topic: String ,options: [String]) {
        
        var topicimage : UIImageView
        topicimage = UIImageView(frame: CGRect(x: 135, y: 210, width: 150 , height: 150))
        topicimage.image = UIImage(named: "a1")
        
        view.addSubview(topicimage)
        
        for index in options.indices {
            let button = UIButton()
            let width = Int(view.bounds.width) / options.count
            button.frame = CGRect(x: index * width, y: 450, width: width, height: width)
            let buttonimage = UIImage(named: options[index])
            button.setImage(buttonimage, for: .normal)
            button.setTitle(options[index], for: .normal)
            button.setTitleColor(.clear, for: .normal)
            button.tag = index
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            //            #if DEBUG
            //            print("index:",suffledOptions[index])
            //            #endif
            view.addSubview(button)
        }
        
    }
    
    @objc func buttonAction(_ sender: UIButton) {
        
        if let title = sender.currentTitle {
            let index = title.index(before: title.endIndex)
            let answer = title[index]
            let character: Character = "4"
            if character == answer {
                
                let alert = UIAlertController(title: "Bingo", message: "", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "Go to next game", style: UIAlertAction.Style.default) { (result : UIAlertAction) -> Void in
                    
                    
                    self.endTime()
                }
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
                
            } else { // Wrong Ans
                
                let alert = UIAlertController(title: "你是智障嗎？", message: "", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "再玩一次", style: UIAlertAction.Style.default) { (result : UIAlertAction) -> Void in
                    
                }
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
        
    }
    
    // MARK: - 倒數器
    func startTime(){
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime(){
        
        timeLabel.text = "剩餘時間: \(totalTime) 秒"
        if totalTime != 0 {
            totalTime -= 1
        } else {
            endTime()
            // show alert
            let alert = UIAlertController(title: "Time's Up⏱", message: "", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Try Again!", style: UIAlertAction.Style.default) { (result : UIAlertAction) -> Void in
                
                self.totalTime = 10
                self.startTime()
                
            }
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    func endTime() {
        timer?.invalidate()
    }
    
    
}


