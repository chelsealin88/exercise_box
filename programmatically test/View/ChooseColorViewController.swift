//
//  ChooseColorViewController.swift
//  programmatically test
//
//  Created by chelsea lin on 2019/3/5.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import UIKit

class ChooseColorViewController: UIViewController {
    
    //    var gameSection: Int = 0
    var level = 0
    
    var games = [ColorGame]()
    
    let topicimage : UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 150, width: 500 , height: 300))
        return image
    }()
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Choose Kolor"
        view.backgroundColor = .white
        
        titleLabel()
        createGames()
        optionsMaker(options: games[0].options)
        gameSetting(topic: "q1", options: games[0].options)
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
    
    // MARK: - 判斷答案
    @objc func buttonAction(_ sender: UIButton){
    
        if let title = sender.currentTitle {
            let index = title.index(before: title.endIndex)
            let answer = title[index]
            let character: Character = "4"
            if character == answer {
                level += 1
                let alert = UIAlertController(title: "答對惹", message: "", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "👉🏻下一關", style: UIAlertAction.Style.default) { (result : UIAlertAction) -> Void in
                    
                    if self.level < self.games.count {
                        let level =  self.level
                        self.gameSetting(topic: "q\(level + 1)", options: self.games[level].options)
                    } else if self.level == self.games.count {
                        let vc = PlusNumberViewController()
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                    
                }
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
                
            } else { // 判斷錯誤答案
                
                let alert = UIAlertController(title: "有障礙？", message: "", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "再玩一次", style: UIAlertAction.Style.default) { (result : UIAlertAction) -> Void in
                    
                }
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
        
    }
    
}




// MARK: - 製作題目
extension  ChooseColorViewController {
    
    // 創建題目＆選項
    func optionsMaker(options: [String]) {
        
        view.addSubview(topicimage)
        
        for index in options.indices {
            let button = UIButton()
            let width = Int(view.bounds.width) / options.count
            button.frame = CGRect(x: index * width, y: 550, width: width, height: width)
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


