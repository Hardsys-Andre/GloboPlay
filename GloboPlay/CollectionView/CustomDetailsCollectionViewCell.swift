//
//  CustomDetailsCollectionViewCell.swift
//  GloboPlay
//
//  Created by Gustavo Boehm on 04/12/22.
//

import UIKit

class CustomDetailsCollectionViewCell: UICollectionViewCell {
    
    static let identifier:String = "CustomDetailsCollectionViewCell"
    
    lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cartaz")
        imageView.contentMode = .scaleToFill
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
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.imageView.heightAnchor.constraint(equalToConstant: 130),
        ])
    }
}
