//
//  CustomCollectionViewCell.swift
//  GloboPlay
//
//  Created by user226298 on 8/30/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier:String = "CustomCollectionViewCell"
    
    lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Druid")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.imageView)
        self.configConstraints()
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configConstraints(){
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
}
