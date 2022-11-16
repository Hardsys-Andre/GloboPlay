//
//  CustomTableViewCell.swift
//  GloboPlay
//
//  Created by user226298 on 8/31/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let identifier:String = "CustomTableViewCell"
       
    lazy var collectionView:UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .init(red: 0, green: 0, blue: 0, alpha: 0.0)
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        return collectionView
    }()
    
    lazy var labelTitulo:UILabel = {
        let titulo = UILabel()
        titulo.text = "Título"
        titulo.font = UIFont.boldSystemFont(ofSize: 35)
        titulo.textColor = .white
        titulo.translatesAutoresizingMaskIntoConstraints = false
        
        return titulo
    }()
    
    func configure(){
        self.addSubview(self.collectionView)
        self.backgroundColor = .init(red: 0, green: 0, blue: 0, alpha: 0.8)
        self.addSubview(labelTitulo)
        self.configConstraints()
        self.configLabelConstraints()
    }

    private func configLabelConstraints(){
        NSLayoutConstraint.activate([
            self.labelTitulo.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.labelTitulo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.labelTitulo.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.labelTitulo.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: labelTitulo.bottomAnchor, constant: 10),
            self.collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

extension CustomTableViewCell:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {        
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell
        return cell ?? UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 230)
    }
}
