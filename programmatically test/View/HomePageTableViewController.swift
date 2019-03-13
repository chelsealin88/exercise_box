//
//  ViewController.swift
//  programmatically test
//
//  Created by chelsea lin on 2019/3/4.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import UIKit

class HomePageTableViewController: UITableViewController {
    
    var gameName : [GameName] = [GameName]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGameArray()
        navigationItem.title = "Exercise Box👾"
        tableView.register(GameCell.self, forCellReuseIdentifier: "cellID")
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameName.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! GameCell
        let gameItem = gameName[indexPath.row]
        cell.indexPath = indexPath
        cell.playItem = gameItem
        cell.textLabel?.text = gameItem.name
        cell.delegate = self
        return cell
    }
    
    // MARK: - 新增遊戲名稱
    func createGameArray(){
        
        gameName.append(GameName(name: "Choose Kolor"))
        gameName.append(GameName(name: "# + # = ? "))
        gameName.append(GameName(name: "What dose this 'word' mean?"))
        
        tableView.reloadData()
        
    }
}

extension HomePageTableViewController : GameCellDelegate {
    
    func nextPage(indexPath: IndexPath) {
        var vc: UIViewController!
        switch indexPath.row {
        case 0: vc = ChooseColorViewController()
        case 1: vc = PlusNumberViewController()
        case 2: vc = WordGameViewController()
        default: break
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


