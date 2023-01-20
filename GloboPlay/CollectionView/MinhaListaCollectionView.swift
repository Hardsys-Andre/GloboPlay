//
//  MinhaListaCollectionView.swift
//  GloboPlay
//
//  Created by user226298 on 12/21/22.
//

import UIKit

class MinhaListaCollectionView: UIViewController {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Minha lista"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        
        return label
    }()
    
    lazy var collectionView:UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .darkGray
        collectionView.register(myListCustomCollectionViewCell.self, forCellWithReuseIdentifier: myListCustomCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        self.view.addSubview(collectionView)
        self.view.addSubview(titleLabel)
        configConstraints()
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            
            self.titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 60),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 35),
            
            self.collectionView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 6),
            self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 4),
            self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -4),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.collectionView.heightAnchor.constraint(equalToConstant: 270),
        ])
    }
}

extension MinhaListaCollectionView:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: myListCustomCollectionViewCell.identifier, for: indexPath) as? myListCustomCollectionViewCell
        
        return cell ?? UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 128, height: 180)
    }
    
}
