//
//  UserSelectionView.swift
//  Spark Scouting
//
//  Created by Ajay Sharma on 2018-11-01.
//  Copyright © 2018 Spark. All rights reserved.
//

import UIKit

class UserSelectionView: UIView {
    
    let scoutButton: UIButton = {
       let but = UIButton()
        but.setTitle("Scout", for: .normal)
        but.backgroundColor = .green
        but.layer.cornerRadius = 10
        but.translatesAutoresizingMaskIntoConstraints = false
        but.addTarget(self, action: #selector(UserSelectionController().presentNextPage), for: .touchUpInside)
        return but
    }()
    
    let viewerButton: UIButton = {
       let but = UIButton()
        but.setTitle("View Ranks", for: .normal)
        but.layer.cornerRadius = 10
        but.translatesAutoresizingMaskIntoConstraints = false
        but.backgroundColor = .orange
        but.addTarget(self, action: #selector(UserSelectionController().presentNextPage), for: .touchUpInside)
        return but
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        AddViews()
        AddConstraints()
        self.backgroundColor = .blue
    }
    
    func AddViews() {
        self.addSubview(scoutButton)
        self.addSubview(viewerButton)
    }
    
    func AddConstraints() {
        
        scoutButton.centerYAnchor.constraint(equalTo: self.topAnchor, constant: UIScreen.main.bounds.maxY / 6).isActive = true
        scoutButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: UIScreen.main.bounds.maxX / 4).isActive = true
        scoutButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: (UIScreen.main.bounds.maxX / 4) * -1).isActive = true
        
        viewerButton.centerYAnchor.constraint(equalTo: scoutButton.bottomAnchor, constant: UIScreen.main.bounds.maxY / 10).isActive = true
        viewerButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: UIScreen.main.bounds.maxX / 4).isActive = true
        viewerButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: (UIScreen.main.bounds.maxX / 4) * -1).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
