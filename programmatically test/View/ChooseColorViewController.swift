//
//  ChooseColorViewController.swift
//  programmatically test
//
//  Created by chelsea lin on 2019/3/5.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import UIKit

class ChooseColorViewController: UIViewController {
    
    var level = 0
    var games = [ColorGame]()
    
    let topicView : UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 150, width: 500 , height: 300))
        return view
    }()
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Choose Kolor"
        view.backgroundColor = .white
        
        titleLabel()
        createGames()
        setUpGameObject()
        creatButtons(game: .init(red: 50, green: 240, blue: 120))
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(backAction))
    }
    
    @objc func backAction(){
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - 標題
    func titleLabel() {
        
        var label = UILabel(frame: CGRect(x: 110, y: 60, width: 200, height: 100))
        label.textAlignment = .center
        label.text = "What Kolor is this?"
        label.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(label)
        
    }
    
    // 創建選項
    fileprivate func creatButtons(game: ColorGame){
        let randomNumber = game.buttonCounts
        topicView.backgroundColor = game.topic
        for index in 0...randomNumber {
            let button = UIButton()
            let width = self.view.bounds.width / CGFloat(randomNumber)
            button.frame = CGRect(x: width * CGFloat(index), y: 300, width: width, height: width)
            button.backgroundColor = game.options[index]
            print(game.options[index])
            button.tag = index + 1
            button.setTitle("\(index + 1)", for: .normal)
            button.layer.cornerRadius = button.bounds.size.width / 2
            button.clipsToBounds = true
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

            view.addSubview(button)
        }
    }
    
    fileprivate func setUpGameObject(){
        
        self.view.addSubview(self.topicView)
        
    }
    
    
    // MARK: - 產生每一局遊戲
    func createGames() {
        let game1 = ColorGame(red: 41/255, green: 152/255, blue: 106/255)
        games.append(game1)
        
    }
    
    // MARK: - 判斷答案
    @objc func buttonAction(_ sender: UIButton){
        
        //        if let title = sender.currentTitle {
        //            let index = title.index(before: title.endIndex)
        //            let answer = title[index]
        //            let character: Character = "4"
        //            if character == answer {
        //                level += 1
        //                let alert = UIAlertController(title: "答對惹", message: "", preferredStyle: UIAlertController.Style.alert)
        //                let okAction = UIAlertAction(title: "👉🏻下一關", style: UIAlertAction.Style.default) { (result : UIAlertAction) -> Void in
        //
        //                    if self.level < self.games.count {
        //                        let level =  self.level
        //                        self.gameSetting(topic: "q\(level + 1)", options: self.games[level].options)
        //                    } else if self.level == self.games.count {
        //                        let vc = PlusNumberViewController()
        //                        self.navigationController?.pushViewController(vc, animated: true)
        //                    }
        //
        //                }
        //                alert.addAction(okAction)
        //                self.present(alert, animated: true, completion: nil)
        //
        //            } else { // 判斷錯誤答案
        //                // TODO: 失敗 重新開始？回到遊戲列表
        //                let alert = UIAlertController(title: "有障礙？", message: "", preferredStyle: UIAlertController.Style.alert)
        //                let cancelAction = UIAlertAction(title: "再試一次", style: .default, handler: nil)
        //
        //                let restartAction = UIAlertAction(title: "重新開始", style: UIAlertAction.Style.default) { (result : UIAlertAction) -> Void in
        //
        //                    self.navigationController?.popToRootViewController(animated: true)
        //                }
        //                alert.addAction(restartAction)
        //                alert.addAction(cancelAction)
        //                self.present(alert, animated: true, completion: nil)
        //            }
        //        }
        
    }
    
    
}

// MARK: - 製作題目
extension ChooseColorViewController {
    
    // 設定題目&選項
    func buttonSetting(game: ColorGame) {
        
        self.topicView.backgroundColor = game.topic
        
        let shuffledOptions = game.options.shuffled()
        
        for index in shuffledOptions {
            
            
        }
        
        
        
    }
    
    
}



