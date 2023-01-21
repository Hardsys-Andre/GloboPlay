//
//  FichaDetails.swift
//  GloboPlay
//
//  Created by user226298 on 12/9/22.
//

import UIKit

class FichaDetails: UIView {
    
    lazy var titleFicha : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ficha técnica"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        
        return label
    }()
    
    lazy var descricaoLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Título Original: Vingadores Ultimate\n Genero: Ação\n Episodios: 6\n Ano de Produção: 2021\n País: Brasil\n Direção: Hardsys\n Elenco: André, Monique, Benício, Helena e Bless"
        label.textColor = UIColor(white: 1, alpha: 0.5)
        label.font = UIFont.systemFont(ofSize: 22)
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubview(titleFicha)
        addSubview(descricaoLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.titleFicha.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.titleFicha.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.titleFicha.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            
            self.descricaoLabel.topAnchor.constraint(equalTo: self.titleFicha.bottomAnchor, constant: 10),
            self.descricaoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.descricaoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
        ])
    }
    
}
