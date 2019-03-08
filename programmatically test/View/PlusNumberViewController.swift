//
//  PlusNumberViewController.swift
//  programmatically test
//
//  Created by chelsea lin on 2019/3/7.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import UIKit

class PlusNumberViewController: UIViewController {
    
    var myStackView = UIStackView()
    
    var number1 = Int.random(in: 1000 ..< 9999)
    var number2 = Int.random(in: 1000 ..< 9999)
    
    var timer: Timer?
    var totalTime = 20
    var timeLabel:UILabel = {
        let timeLabel = UILabel(frame: CGRect(x: 100, y: 100, width: 300, height: 50))
        timeLabel.font = UIFont.systemFont(ofSize: 30)
        timeLabel.text = ""
        return timeLabel
    }()
    
    var ansTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 15.0
        textField.borderStyle = .bezel
        return textField
    }()
    
    
    // MARK: - Stack View 水平
    func setUpStackView(){
        
        view.addSubview(myStackView)
        myStackView.translatesAutoresizingMaskIntoConstraints = false
        myStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10)
        myStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10)
        myStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10)
        myStackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -10)
        
        myStackView.axis = .horizontal
        myStackView.alignment = .fill
        myStackView.distribution = .fill
        myStackView.spacing = 10
        myStackView.backgroundColor = UIColor.clear
    }
    
    func setUpObject(){
        //        myStackView.addArrangedSubview()
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Plus Number"
        view.backgroundColor = .white
        
        namber1Label()
        namber2Label()
        ansButton()
        plusImage()
        equalImage()
        startTime()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(backAction))
        
        self.ansTextField.frame = CGRect(x: 150, y: 320, width: 100, height: 50)
        view.addSubview(self.ansTextField)
        view.addSubview(self.timeLabel)
    }
    
    @objc func backAction(){
        navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: - 生成數字
    func namber1Label() {
        
        var label = UILabel(frame: CGRect(x: 0, y: 200, width: 200, height: 100))
        label.textAlignment = .center
        label.text = String(number1)
        label.font = UIFont.systemFont(ofSize: 40)
        view.addSubview(label)
        
    }
    
    func namber2Label() {
        
        var label = UILabel(frame: CGRect(x: 150, y: 200, width: 200, height: 100))
        label.textAlignment = .center
        label.text = String(number2)
        label.font = UIFont.systemFont(ofSize: 40)
        view.addSubview(label)
        
    }
    
    func plusImage() {
        
        let image = UIImageView(frame: CGRect(x: 150, y: 225, width: 50, height: 50))
        image.image = UIImage(named: "plus")
        view.addSubview(image)
    }
    
    func equalImage() {
        let image = UIImageView(frame: CGRect(x: 300, y: 225, width: 50, height: 50))
        image.image = UIImage(named: "equal")
        view.addSubview(image)
    }
    
    // MARK: - 生成確定button
    func ansButton() {
        
        let button = UIButton.init(type: UIButton.ButtonType.system)
        button.setTitle("Enter", for: .normal)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.clear.cgColor
        button.backgroundColor = UIColor.init(red: 0/235, green: 102/235, blue: 204/235, alpha: 1.0)
        button.titleLabel?.textColor = UIColor.white
        button.tintColor = UIColor.white
        button.layer.cornerRadius = 15.0
        button.frame = CGRect(x: 150, y: 400, width: 100, height: 30)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        view.addSubview(button)
        
    }
    
    @objc func buttonAction() {
        
        guard let answer = ansTextField.text else { return }
        let answers = String(number1 + number2)
        if answer == answers {
            
            let alert = UIAlertController(title: "Bingo", message: "", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Go to next game", style: UIAlertAction.Style.default) { (result : UIAlertAction) -> Void in
                
                self.endTime()
                
                let vc = WordGameViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            
        } else {
            
            
            let alert = UIAlertController(title: "智障？", message: "", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Try Again", style: UIAlertAction.Style.default) { (result : UIAlertAction) -> Void in
                
                self.ansTextField.text = ""
            }
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
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
            let alert = UIAlertController(title: "Time's Up", message: "", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Try Again", style: UIAlertAction.Style.default) { (result : UIAlertAction) -> Void in
                
                self.ansTextField.text = ""
                self.totalTime = 20
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
