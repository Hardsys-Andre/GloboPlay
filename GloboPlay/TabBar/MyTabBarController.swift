//
//  MyTabBarController.swift
//  GloboPlay
//
//  Created by user226298 on 11/9/22.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBarController()
    }
    
    private func setupTabBarController(){
        let tela1 = FilmesTableView()
        
        self.setViewControllers([tela1], animated: false)
        self.tabBar.backgroundColor = .white
        self.tabBar.isTranslucent = false
        
        guard let items = tabBar.items else{return}
        items[0].title = "GloboPlay"
        
    }

}
