//
//  CustomTableViewCell.swift
//  GloboPlay
//
//  Created by user226298 on 8/31/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let identifier:String = "CustomTableViewCell"
    
   
    
    /*let customView:CustomTableView = {
        
        let view = CustomTableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = .white
        
        return view
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(self.customView)
        self.backgroundColor = .lightGray
        self.configConstraints()
    }
    
   
    private func configConstraints(){
        NSLayoutConstraint.activate([
            self.customView.topAnchor.constraint(equalTo: self.topAnchor),
            self.customView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.customView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.customView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }*/
    
    lazy var collectionView:UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .black
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
       
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        //layout.itemSize = CGSize(width: view.frame.width, height: 200)
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: true)
        layout.estimatedItemSize = .zero
        collectionView.delegate = self
        collectionView.dataSource = self
        /*if let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            layout.scrollDirection = .horizontal
            layout.estimatedItemSize = .zero
        }*/
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
 
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(self.collectionView)
        self.backgroundColor = .black
        self.addSubview(labelTitulo)
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

extension CustomTableViewCell:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
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
