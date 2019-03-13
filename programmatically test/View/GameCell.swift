//
//  GameCell.swift
//  programmatically test
//
//  Created by chelsea lin on 2019/3/5.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import Foundation
import UIKit

protocol GameCellDelegate {
    
    func nextPage(indexPath: IndexPath)
}

class GameCell: UITableViewCell {
    
    var playItem: GameName!
    var delegate : GameCellDelegate?
    var indexPath: IndexPath?
    
    let gameNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        return label
    }()
    
    
    @objc func click(){
        
        if let indexPath = indexPath {
            delegate?.nextPage(indexPath: indexPath)
        }
    }
    
    
    let playButton : UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.system)
        button.setTitle("Play", for: .normal)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = UIColor.black
        button.titleLabel?.textColor = UIColor.white
        button.tintColor = UIColor.white
        button.layer.cornerRadius = 15.0
        return button
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(gameNameLabel)
        addSubview(playButton)
        
        playButton.addTarget(self, action: #selector(click), for: .touchUpInside)
        playButton.anchor(top: topAnchor, left: gameNameLabel.leftAnchor
            , bottom: bottomAnchor, right: rightAnchor, paddingTop: 15.0, paddingLeft: 300.0, paddingBottom: 15.0, paddingRight: 10.0, width: 100, height: 30, enableInsets: false)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
