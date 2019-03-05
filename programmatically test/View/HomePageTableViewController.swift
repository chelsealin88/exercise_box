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
        
        navigationItem.title = "Exercise Box"
        tableView.register(GameCell.self, forCellReuseIdentifier: "cellID")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameName.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! GameCell
        let gameItem = gameName[indexPath.row]
        cell.textLabel?.text = gameItem.name
        cell.translatesAutoresizingMaskIntoConstraints = false
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func createGameArray(){
        gameName.append(GameName(name: "Choose Color"))
    }
    
}
