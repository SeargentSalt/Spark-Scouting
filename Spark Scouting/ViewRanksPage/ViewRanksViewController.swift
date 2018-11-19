//
//  ViewRanksViewController.swift
//  Spark Scouting
//
//  Created by Ajay Sharma on 2018-11-06.
//  Copyright © 2018 Spark. All rights reserved.
//

import UIKit

class ViewRanksViewController: UINavigationController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 100
        let cv = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.maxX, height: view.frame.maxY), collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .red
        cv.register(RanksViewCell.self, forCellWithReuseIdentifier: "cellId")
        return cv
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! RanksViewCell
        return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.maxX, height: 100)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        view.bringSubviewToFront(self.navigationBar)
        view.backgroundColor = .blue
    }

}
