//
//  SelectorView.swift
//  GloboPlay
//
//  Created by Gustavo Boehm on 04/12/22.
//

import UIKit

protocol detalhesAssistaDelegate: AnyObject{
    func tappedAssista()
    func tappedDetalhes()
    func tappedBarra()
    func tappedBarraDetalhes()
}

class SelectorView: UIView {
    
    private weak var delegate: detalhesAssistaDelegate?
    
    
    public func delegate(delegate: detalhesAssistaDelegate?){
        self.delegate = delegate
    }
    
    lazy var stackView: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [buttomLeftView, buttomRightView])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var buttomLeftView: UIView = {
        let view = UIView()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tappedAssistaTB))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.addGestureRecognizer(gesture)
        
        return view
    }()
    
    @objc func tappedAssistaTB(_ sender: UITapGestureRecognizer){
        delegate?.tappedAssista()
        delegate?.tappedBarra()
    }
    
    lazy var selectorAssistaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ASSISTA TAMBÉM"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)

        return label
    }()
    
    lazy var buttomRightView: UIView = {
        let view = UIView()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tappedDetalhesExibir))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.addGestureRecognizer(gesture)
        
        return view
    }()
    
    @objc func tappedDetalhesExibir(_ sender: UITapGestureRecognizer){
        delegate?.tappedDetalhes()
        delegate?.tappedBarraDetalhes()
    }
    
    lazy var selectorDetailsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "DETALHES"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)

        return label
    }()
    
    lazy var barView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    lazy var barViewAssista: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    var detalhesSelecionado = true
    
    init() {
        super.init(frame: .zero)
        addSubview(selectorAssistaLabel)
        addSubview(selectorDetailsLabel)
        addSubview(barView)
        addSubview(barViewAssista)
        addSubview(stackView)
        barViewAssista.isHidden = true
        buttomLeftView.addSubview(selectorAssistaLabel)
        buttomRightView.addSubview(selectorDetailsLabel)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSelected() {
        if detalhesSelecionado {
            barView.isHidden = true
            barViewAssista.isHidden = false
        }else{
            return barView.isHidden = false
        }
    }
    
    func detalheSelected(){
        if detalhesSelecionado {
            barView.isHidden = false
            barViewAssista.isHidden = true
        }else{
            return barView.isHidden = true
        }
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            self.stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            self.stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            self.stackView.heightAnchor.constraint(equalToConstant: 40),
            
            self.selectorAssistaLabel.centerYAnchor.constraint(equalTo: buttomLeftView.centerYAnchor),
            self.selectorAssistaLabel.leadingAnchor.constraint(equalTo: buttomLeftView.leadingAnchor),
            
            self.selectorDetailsLabel.centerYAnchor.constraint(equalTo: buttomRightView.centerYAnchor),
            self.selectorDetailsLabel.leadingAnchor.constraint(equalTo: buttomRightView.leadingAnchor),
        
                self.barView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 6),
                self.barView.widthAnchor.constraint(equalToConstant: 120),
                self.barView.heightAnchor.constraint(equalToConstant: 5),
                self.barView.centerXAnchor.constraint(equalTo: selectorDetailsLabel.centerXAnchor),

                self.barViewAssista.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 6),
                self.barViewAssista.widthAnchor.constraint(equalToConstant: 180),
                self.barViewAssista.heightAnchor.constraint(equalToConstant: 5),
                self.barViewAssista.centerXAnchor.constraint(equalTo: selectorAssistaLabel.centerXAnchor)

                ])
    }
}
