//
//  MyTabBarController.swift
//  GloboPlay
//
//  Created by user226298 on 11/9/22.
//

import UIKit

class TabBarController: UITabBarController {

    lazy var tela1: UIViewController = {
        let tela1 = FilmesTableView()
        
        return tela1
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBarController()
    }
    
    private func setupTabBarController(){
        
        let tela2 = UINavigationController(rootViewController: tela2())
        self.setViewControllers([tela1, tela2], animated: false)
        
        self.tabBar.backgroundColor = .white
        self.tabBar.isTranslucent = false
        
        
        guard let items = tabBar.items else{return}
        items[0].title = "GloboPlay"
        items[0].image = UIImage(systemName: "house")
        items[1].title = "Favoritos"
        items[1].image = UIImage(systemName: "star")
        
    }

}

class tela2:UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.title = "Favoritos"
    }
}
