//
//  DetailsViewController.swift
//  GloboPlay
//
//  Created by user226298 on 11/29/22.
//

import UIKit

class DetailsViewController: UIViewController {

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
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .white
        
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.view.addSubview(imageDetails)
        self.view.addSubview(titleLabel)
        configConstraints()

    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            self.imageDetails.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            self.imageDetails.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.imageDetails.heightAnchor.constraint(equalToConstant: 250),
            self.imageDetails.widthAnchor.constraint(equalToConstant: 180),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.imageDetails.bottomAnchor, constant:20),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            //self.titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            //self.titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 50),
        ])
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
