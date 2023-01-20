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

}

protocol barViewDelegate: AnyObject{
func tappedBarSelected()
}

class SelectorView: UIView {
    
    private weak var delegateBar: barViewDelegate?
    
    private weak var delegate: detalhesAssistaDelegate?
    
    public func delegateBar(delegate: barViewDelegate?){
        self.delegateBar = delegate
    }
    
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
        delegateBar?.tappedBarSelected()
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
    
    var detalhesSelecionado = true
    
    init() {
        super.init(frame: .zero)
        //delegateBar(delegate: self)
        //self.detalhesSelecionado = detalhesSelecionado
        addSubview(selectorAssistaLabel)
        addSubview(selectorDetailsLabel)
        addSubview(barView)
        addSubview(stackView)
        //setSelected()
        buttomLeftView.addSubview(selectorAssistaLabel)
        buttomRightView.addSubview(selectorDetailsLabel)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSelected() {
        detalhesSelecionado = false
        
        
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            self.stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            self.stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            self.stackView.heightAnchor.constraint(equalToConstant: 50),
            
            self.selectorAssistaLabel.centerYAnchor.constraint(equalTo: buttomLeftView.centerYAnchor),
            self.selectorAssistaLabel.leadingAnchor.constraint(equalTo: buttomLeftView.leadingAnchor),
            
            self.selectorDetailsLabel.centerYAnchor.constraint(equalTo: buttomRightView.centerYAnchor),
            self.selectorDetailsLabel.leadingAnchor.constraint(equalTo: buttomRightView.leadingAnchor),
        ])
        
            if detalhesSelecionado == true {
                NSLayoutConstraint.activate([
                self.barView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 12),
                self.barView.widthAnchor.constraint(equalToConstant: 120),
                self.barView.heightAnchor.constraint(equalToConstant: 5),
                self.barView.centerXAnchor.constraint(equalTo: selectorDetailsLabel.centerXAnchor)
                ])
            } else {
                NSLayoutConstraint.activate([
                self.barView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 12),
                self.barView.widthAnchor.constraint(equalToConstant: 120),
                self.barView.heightAnchor.constraint(equalToConstant: 5),
                self.barView.centerXAnchor.constraint(equalTo: selectorAssistaLabel.centerXAnchor)


                ])
            }
    }
}
