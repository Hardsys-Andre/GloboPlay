//
//  MoreDetailsCollectionView.swift
//  GloboPlay
//
//  Created by Gustavo Boehm on 04/12/22.
//

import UIKit

class MoreDetailsCollectionView: UIView {
    
    lazy var collectionView:UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .init(red: 0, green: 0, blue: 0, alpha: 0.0)
        collectionView.register(CustomDetailsCollectionViewCell.self, forCellWithReuseIdentifier: CustomDetailsCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        return collectionView
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 28/255, alpha: 1.0)
        addSubview(collectionView)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configConstraints(){
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 6),
            self.collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            self.collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            self.collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.collectionView.heightAnchor.constraint(equalToConstant: 270),
        ])
    }
}

extension MoreDetailsCollectionView:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomDetailsCollectionViewCell.identifier, for: indexPath) as? CustomDetailsCollectionViewCell
        
        return cell ?? UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 115, height: 130)
    }
    
}
