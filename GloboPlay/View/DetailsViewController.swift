//
//  DetailsViewController.swift
//  GloboPlay
//
//  Created by user226298 on 11/29/22.
//

import UIKit

protocol playYoutubeDelegate: AnyObject {
    func tappedPlayYoutube()
}

class DetailsViewController: UIViewController, detalhesAssistaDelegate {
    
    private weak var delegateYoutube: playYoutubeDelegate?
    
    public func delegateYoutube(delegate: playYoutubeDelegate?){
        self.delegateYoutube = delegate
    }
    
    lazy var backImageButton: UIButton = {
        let button = UIButton()
        button .translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Botão Back.png"), for: .normal)
        button.addTarget(self, action: #selector(tappedBack), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedBack(){
        navigationController?.popViewController(animated: true)
    }

    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .black
        scroll.isScrollEnabled = true
        return scroll
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imageDetails: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "cartaz")
        
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Vingadores Ultimate"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .white
        
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Filme"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = UIColor(white: 1, alpha: 0.5)
        
        return label
    }()
    
    lazy var resumeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ultimo filme da saga Vingadores onde\n os herois derrotam o vilão e salvam\n a humanidade mais uma vez"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor(white: 1, alpha: 0.5)
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var buttomLeftView: UIView = {
        let view = UIView()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tappedPlayerYoutube))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.addGestureRecognizer(gesture)
        return view
    }()
    
    @objc func tappedPlayerYoutube(_ sender: UITapGestureRecognizer){
        self.delegateYoutube?.tappedPlayYoutube()
        let playerYoutubeController = PlayerYoutube()
        self.navigationController?.pushViewController(playerYoutubeController, animated: true)
    }
    
    lazy var playImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "play.fill")
        image.tintColor = .black
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var nameButtomLeft: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Assista"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    lazy var buttomRightView: UIView = {
        let view = UIView()
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tappedFavoritar))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        view.addGestureRecognizer(recognizer)
        
        return view
    }()
    
    @objc func tappedFavoritar(){
        trocarFavoritos()
    }
    
    public func trocarFavoritos(){
        let labelRight = nameButtomRight
        labelRight.text = "Adicionado"
        let check = starImage
        check.image = UIImage(named: "White_check")
        
    }
    
    lazy var starImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "star.fill")
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var nameButtomRight: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Minha Lista"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [buttomLeftView, buttomRightView])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    lazy var selectorView: SelectorView = {
        let selector = SelectorView()
        selector.translatesAutoresizingMaskIntoConstraints = false
        return selector
    }()

    lazy var detalhesAssista: DetalhesAssista = {
        let view = DetalhesAssista()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectorView.delegate(delegate: self)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(backImageButton)
        contentView.addSubview(imageDetails)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(resumeLabel)
        contentView.addSubview(stackView)
        contentView.addSubview(selectorView)
        contentView.addSubview(detalhesAssista)
        self.buttomLeftView.addSubview(nameButtomLeft)
        self.buttomLeftView.addSubview(playImage)
        self.buttomRightView.addSubview(nameButtomRight)
        self.buttomRightView.addSubview(starImage)
        configConstraints()
        contentView.layoutIfNeeded()
        self.scrollView.contentSize.height = self.contentView.frame.height
    }
    
    func tappedBarra() {
        let barra = SelectorView()
        barra.detalhesSelecionado = false
        if barra.detalhesSelecionado == false{
            selectorView.setSelected()
        }
    }
    
    func tappedBarraDetalhes() {
        let barra = SelectorView()
        barra.detalhesSelecionado = false
        if barra.detalhesSelecionado == false{
            selectorView.detalheSelected()
        }
    }

    func tappedAssista() {
        let detalheAssista = DetalhesAssista()
        detalheAssista.selecionar = true
        
        if detalheAssista.selecionar == true{
            detalhesAssista.click()
        }
    }
    
    func tappedDetalhes() {
        let detalhe = DetalhesAssista()
        detalhe.selecionar = true
        
        if detalhe.selecionar == true{
            detalhesAssista.clickDetalhes()
        }
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            self.backImageButton.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 4),
            self.backImageButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            self.backImageButton.heightAnchor.constraint(equalToConstant: 45),
            
            self.imageDetails.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 25),
            self.imageDetails.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.imageDetails.heightAnchor.constraint(equalToConstant: 200),
            self.imageDetails.widthAnchor.constraint(equalToConstant: 150),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.imageDetails.bottomAnchor, constant:10),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 25),
            
            self.subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 10),
            self.subtitleLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.subtitleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            self.resumeLabel.topAnchor.constraint(equalTo: self.subtitleLabel.bottomAnchor, constant: 10),
            self.resumeLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            
            self.stackView.topAnchor.constraint(equalTo: self.resumeLabel.bottomAnchor, constant: 10),
            self.stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            self.stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            self.stackView.heightAnchor.constraint(equalToConstant: 50),
            
            self.playImage.centerYAnchor.constraint(equalTo: self.buttomLeftView.centerYAnchor),
            self.playImage.trailingAnchor.constraint(equalTo: self.nameButtomLeft.leadingAnchor, constant: -10),
            self.playImage.heightAnchor.constraint(equalToConstant: 30),
            self.playImage.widthAnchor.constraint(equalToConstant: 25),
            
            self.nameButtomLeft.centerYAnchor.constraint(equalTo: self.buttomLeftView.centerYAnchor),
            self.nameButtomLeft.centerXAnchor.constraint(equalTo: self.buttomLeftView.centerXAnchor),
            
            self.starImage.centerYAnchor.constraint(equalTo: self.buttomRightView.centerYAnchor),
            self.starImage.trailingAnchor.constraint(equalTo: self.nameButtomRight.leadingAnchor, constant: -5),
            self.starImage.heightAnchor.constraint(equalToConstant: 30),
            self.starImage.widthAnchor.constraint(equalToConstant: 25),
            
            self.nameButtomRight.centerYAnchor.constraint(equalTo: self.buttomRightView.centerYAnchor),
            self.nameButtomRight.centerXAnchor.constraint(equalTo: self.buttomRightView.centerXAnchor),
            
            self.selectorView.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 10),
            self.selectorView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.selectorView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.selectorView.heightAnchor.constraint(equalToConstant: 60),
            
            self.detalhesAssista.topAnchor.constraint(equalTo: self.selectorView.bottomAnchor, constant: 0),
            self.detalhesAssista.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 6),
            self.detalhesAssista.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -6),
            self.detalhesAssista.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0),
            
        ])
    }
}
