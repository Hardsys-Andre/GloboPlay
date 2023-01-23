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
    lazy var tela2: UIViewController = {
        let tela2 = MinhaListaCollectionView()
        
        return tela2
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBarController()

    }
    
    private func setupTabBarController(){
        
        //let tela2 = UINavigationController(rootViewController: tela2())
        self.setViewControllers([tela1, tela2], animated: false)
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = .white
        UITabBar.appearance().barTintColor = .black
        self.navigationController?.navigationBar.barTintColor = .black
        
        
        
        guard let items = tabBar.items else{return}
        items[0].title = "GloboPlay"
        items[0].image = UIImage.init(named: "home_black")
        items[1].title = "Favoritos"
        items[1].image = UIImage(systemName: "star")
        
    }

}


