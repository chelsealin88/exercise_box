//
//  WordGameViewController.swift
//  programmatically test
//
//  Created by chelsea lin on 2019/3/7.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import UIKit

class WordGameViewController: UIViewController {
    
    var level = 0
    var games = [WordGame]()
    
    var timer: Timer?
    var totalTime = 10
    var timeLabel:UILabel = {
        let timeLabel = UILabel(frame: CGRect(x: 100, y: 130, width: 300, height: 50))
        timeLabel.font = UIFont.systemFont(ofSize: 30)
        timeLabel.text = ""
        return timeLabel
    }()
    
    let topicimage : UIImageView = {
        let image = UIImageView(frame: CGRect(x: 135, y: 210, width: 150 , height: 150))
        return image
    }()
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "What dose this Word mean?"
        view.backgroundColor = .white
        
        titleLabel()
        creatGames()
        startTime()
        optionsMaker(options: games[0].options)
        gameSetting(topic: "a1", options: games[0].options)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(backAction))
        view.addSubview(self.timeLabel)
    }
    
    @objc func backAction(){
        navigationController?.popToRootViewController(animated: true)
        endTime()
    }
    
    func titleLabel() {
        
        var label = UILabel(frame: CGRect(x: 0, y: 60, width: 400, height: 100))
        label.textAlignment = .center
        label.text = "請找出字的顏色🤔"
        label.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(label)
        
    }
    
    // MARK: - 產生每一局遊戲
    func creatGames() {
        let game1 = WordGame(topic: "a1", answer: 3)
        let game2 = WordGame(topic: "a2", answer: 3)
        games.append(game1)
        games.append(game2)
        
    }
    
    @objc func buttonAction(_ sender: UIButton) {
        
        if let title = sender.currentTitle {
            let index = title.index(before: title.endIndex)
            let answer = title[index]
            let character: Character = "4"
            if character == answer {
                level += 1
                let alert = UIAlertController(title: "Bingo🤡", message: "", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "下一關GO GO!", style: UIAlertAction.Style.default) { (result : UIAlertAction) -> Void in
                    
                    if self.level < self.games.count {
                        let level =  self.level
                        self.gameSetting(topic: "a\(level + 1)", options: self.games[level].options)
                       
                    } else if self.level == self.games.count {
                        
                        // push to next game
                    }
                    self.endTime()
                }
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
                
            } else { // Wrong Ans
                
                let alert = UIAlertController(title: "你是智障嗎？", message: "", preferredStyle: UIAlertController.Style.alert)
                let cancelAction = UIAlertAction(title: "再試一次", style: .default, handler: nil)
                let restartAction = UIAlertAction(title: "返回首頁", style: UIAlertAction.Style.default) { (result : UIAlertAction) -> Void in
                    
                    self.navigationController?.popToRootViewController(animated: true)
                }

                alert.addAction(restartAction)
                alert.addAction(cancelAction)
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

// MARK: - 製作題目
extension  WordGameViewController {
    
    // 創建題目＆選項
    func optionsMaker(options: [String]) {
        
        view.addSubview(topicimage)
        
        for index in options.indices {
            let button = UIButton()
            let width = Int(view.bounds.width) / options.count
            button.frame = CGRect(x: index * width, y: 450, width: width, height: width)
            let buttonimage = UIImage(named: options[index])
            button.tag = index + 1 // Tag預設都是0，會抓不到index
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            view.addSubview(button)
        }
    }
    
    // 設定題目＆選項
    func gameSetting(topic: String, options: [String]){
        
        topicimage.image = UIImage(named: "\(topic)")
        
        let suffledOptions = options.shuffled()
        
        for index in suffledOptions.indices {
            
            guard let button = self.view.viewWithTag(index + 1) as? UIButton else { return }
            let buttonimage = UIImage(named: suffledOptions[index])
            button.setImage(buttonimage, for: .normal)
            button.setTitle(suffledOptions[index], for: .normal)
            button.setTitleColor(.clear, for: .normal)
            
        }
    }
}
