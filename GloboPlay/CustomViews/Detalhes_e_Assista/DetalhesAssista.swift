//
//  DetalhesAssista.swift
//  GloboPlay
//
//  Created by user226298 on 1/17/23.
//

import UIKit

class DetalhesAssista: UIView {

    lazy var stackViewDetalhesAssista: UIStackView = {
    let stack = UIStackView(arrangedSubviews: [moreDetailsCollectionView, fichaDetails])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 10
        //stack.backgroundColor = .red
        stack.isLayoutMarginsRelativeArrangement = true
        
        return stack
    }()
    
    lazy var moreDetailsCollectionView: MoreDetailsCollectionView = {
        let collection = MoreDetailsCollectionView()
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        return collection
    }()
    
    lazy var fichaDetails: FichaDetails = {
        let ficha = FichaDetails()
        ficha.translatesAutoresizingMaskIntoConstraints = false
        
        return ficha
    }()
    var selecionar = true
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubview(stackViewDetalhesAssista)
        addSubview(moreDetailsCollectionView)
        addSubview(fichaDetails)
        moreDetailsCollectionView.isHidden = true
        setupeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func click() {
        if selecionar {
            fichaDetails.isHidden = true
            moreDetailsCollectionView.isHidden = false
        }else{
            return fichaDetails.isHidden = false
        }
        
    }
    
    func clickDetalhes(){
        if selecionar {
            moreDetailsCollectionView.isHidden = true
            fichaDetails.isHidden = false
        }
    }
    
    private func setupeConstraints(){
        NSLayoutConstraint.activate([
            stackViewDetalhesAssista.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            stackViewDetalhesAssista.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            stackViewDetalhesAssista.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            stackViewDetalhesAssista.heightAnchor.constraint(equalToConstant: 500),
            
            moreDetailsCollectionView.topAnchor.constraint(equalTo: stackViewDetalhesAssista.topAnchor, constant: 0),
            moreDetailsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            moreDetailsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            moreDetailsCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            fichaDetails.leadingAnchor.constraint(equalTo: leadingAnchor),
            fichaDetails.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            
        ])
    }
    
}
