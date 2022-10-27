//
//  CustomTableView.swift
//  GloboPlay
//
//  Created by user226298 on 8/31/22.
//

import UIKit

class CustomTableView: UIView {

    
    lazy var collectionView:UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
       
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        //layout.itemSize = CGSize(width: view.frame.width, height: 200)
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: false)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
        
    }()
    
    lazy var labelTitulo:UILabel = {
        let titulo = UILabel()
        titulo.text = "Novelas"
        //titulo.font = UIFont.systemFont(ofSize: 30)
        titulo.font = UIFont.boldSystemFont(ofSize: 40)
        titulo.textColor = .white
        
        titulo.translatesAutoresizingMaskIntoConstraints = false
        
        return titulo

}()
    
      override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.collectionView)
        self.addSubview(labelTitulo)
        
        self.backgroundColor = .black
        self.configConstraints()
        self.configLabelConstraints()
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configLabelConstraints(){
        NSLayoutConstraint.activate([
            self.labelTitulo.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            self.labelTitulo.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.labelTitulo.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.labelTitulo.heightAnchor.constraint(equalToConstant: 50)
        
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

extension CustomTableView:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell
        return cell ?? UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }
}
