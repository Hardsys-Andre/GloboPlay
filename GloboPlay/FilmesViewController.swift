//
//  FilmesViewController.swift
//  GloboPlay
//
//  Created by user226298 on 8/29/22.
//

import UIKit

final class FilmesViewController: UIViewController{
    
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
    
    lazy var imageViewTopo:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "topoGP")
        imageView.backgroundColor = .white
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView

}()
    
    override func viewDidLoad() {
        view.backgroundColor = .black
        self.view.addSubview(self.collectionView)
        self.view.addSubview(imageViewTopo)
        self.configConstraints()
    }
    
    private func configConstraintsImageTopo(){
        NSLayoutConstraint.activate([
            self.imageViewTopo.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.imageViewTopo.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.imageViewTopo.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.imageViewTopo.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: 20),
            //self.imageViewTopo.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: imageViewTopo.bottomAnchor, constant: 150),
            self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

extension FilmesViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
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
        return CGSize(width: 150, height: 150)
    }
    
    
}
