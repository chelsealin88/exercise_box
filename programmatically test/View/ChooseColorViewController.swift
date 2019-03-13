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
        let view = UIView(frame: CGRect(x: 0, y: 150, width: UIScreen.main.bounds.width , height: 300))
        return view
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Choose Kolor"
        view.backgroundColor = .white
        
        titleLabel()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(backAction))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createGames()
        setUpGameObject()
        creatButtons(game: games[level])
        buttonColorSetting(game: games[level])
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
    
    func removeButtons(game: ColorGame) {
        
        for index in game.options.indices {
            guard let button = self.view.viewWithTag(index + 1) as? UIButton else { return }
            button.removeFromSuperview()
        }
    }
    
    // 創建Button Without Color
    fileprivate func creatButtons(game: ColorGame){
        let count = game.options.count
        for index in game.options.indices {
            let button = UIButton()
            let width = self.view.bounds.width / CGFloat(count)
            button.frame = CGRect(x: width * CGFloat(index), y: 500, width: width, height: width)
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
    
    fileprivate func buttonColorSetting(game: ColorGame) {
        
        topicView.backgroundColor = game.topic
        
        for index in game.options.indices {
            guard let button = self.view.viewWithTag(index + 1) as? UIButton else { return }
            button.backgroundColor = game.options[index]
        }
    }
    
    // MARK: - 產生每一局遊戲
    func createGames() {
        for _ in 1...3 {
            let game = ColorGame()
            games.append(game)
        }
    }
    
    // MARK: - 判斷答案
    @objc func buttonAction(_ sender: UIButton){
        
        print(sender.tag)
        let game = games[level]
        let answer = game.answer
        let selectedColor = games[level].options[sender.tag - 1]
        
        if answer == selectedColor {
            
            let alert = UIAlertController(title: "答對惹", message: "", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "👉🏻下一關", style: UIAlertAction.Style.default) { (result : UIAlertAction) -> Void in
                self.removeButtons(game: game)
                self.level += 1
                if self.level < self.games.count {
                    let newGame = self.games[self.level]
                    self.creatButtons(game: newGame)
                    self.buttonColorSetting(game: newGame)
                } else {
                    
                    let vc = PlusNumberViewController()
                    self.navigationController?.pushViewController(vc, animated: true)
                }
                
            }
            
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            
        } else { // 判斷錯誤答案
            // TODO: 失敗 重新開始？回到遊戲列表
            let alert = UIAlertController(title: "有障礙？", message: "", preferredStyle: UIAlertController.Style.alert)
            let cancelAction = UIAlertAction(title: "再試一次", style: .default, handler: nil)
            
            let restartAction = UIAlertAction(title: "回到首頁", style: UIAlertAction.Style.default) { (result : UIAlertAction) -> Void in
                
                self.navigationController?.popToRootViewController(animated: true)
            }
            alert.addAction(restartAction)
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
}



