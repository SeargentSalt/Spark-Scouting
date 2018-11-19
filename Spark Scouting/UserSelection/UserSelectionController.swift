//
//  ViewController.swift
//  Spark Scouting
//
//  Created by Ajay Sharma on 2018-11-01.
//  Copyright © 2018 Spark. All rights reserved.
//

import UIKit

class UserSelectionController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    var imageArray: [UIImage] = [UIImage(named: "test")!, UIImage(named: "test2")!, UIImage(named: "test3")!]
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PreviewPicturesCell
        myCell.displayImage = imageArray[indexPath.item]
        
        return myCell
    }
    
    
    let mainView: UIView = {
       let main = UserSelectionView()
        main.translatesAutoresizingMaskIntoConstraints = false
        return main
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.maxX, height: view.frame.maxY / 2), collectionViewLayout: layout)
        cv.register(PreviewPicturesCell.self, forCellWithReuseIdentifier: "cellId")
        cv.backgroundColor = .red
        cv.delegate = self
        cv.dataSource = self
        cv.isPagingEnabled = true
        return cv
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red

        
        setupViews()
        setupConstraints()
        
        startTimer()
    
    }
    
    func setupViews() {
        view.addSubview(mainView)
        view.addSubview(collectionView)
    }
    
    func setupConstraints() {
        mainView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mainView.topAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

    }
    
    
    @objc func presentNextPage(sender: UIButton!) {
        if(sender.titleLabel?.text == "Scout") {
            present(ScoutingViewController(), animated: true, completion: nil)
        }
        else if (sender.titleLabel?.text == "View Ranks") {
            present(ViewRanksViewController(), animated: true, completion: nil)
        }
    }
    
    @objc func scrollToNextCell(){
        
        //get cell size
        let cellSize = view.frame.size
        
        //get current content Offset of the Collection view
        let contentOffset = collectionView.contentOffset
        
        if collectionView.contentSize.width <= collectionView.contentOffset.x + cellSize.width
        {
            let r = CGRect(x: 0, y: contentOffset.y, width: cellSize.width, height: cellSize.height)
            collectionView.scrollRectToVisible(r, animated: true)
            
        } else {
            let r = CGRect(x: contentOffset.x + cellSize.width, y: contentOffset.y, width: cellSize.width, height: cellSize.height)
            collectionView.scrollRectToVisible(r, animated: true);
        }
        
    }

    func startTimer() {
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(scrollToNextCell), userInfo: nil, repeats: true);
        
    }


}

