//
//  PreviewPicturesView.swift
//  Spark Scouting
//
//  Created by Ajay Sharma on 2018-11-06.
//  Copyright © 2018 Spark. All rights reserved.
//

import UIKit

class PreviewPicturesCell: UICollectionViewCell {
    
    var displayImage: UIImage? {
        didSet {
            previewPictures.image = displayImage!
        }
    }
    
    let previewPictures: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "test")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        self.addSubview(previewPictures)
    }
    
    func setupConstraints() {
        previewPictures.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        previewPictures.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        previewPictures.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        previewPictures.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
