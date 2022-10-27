//
//  CustomCollectionViewCell.swift
//  GloboPlay
//
//  Created by user226298 on 8/30/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier:String = "CustomCollectionViewCell"
    
    let customView:CustomView = {
        let view = CustomView()
        view.translatesAutoresizingMaskIntoConstraints = false
       
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(self.customView)
        self.backgroundColor = .lightGray
        self.configConstraints()
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            self.customView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.customView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.customView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            self.customView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
        ])
    }
}
