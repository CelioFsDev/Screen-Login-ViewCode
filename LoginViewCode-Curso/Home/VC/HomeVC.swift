//
//  HomeVCViewController.swift
//  LoginViewCode-Curso
//
//  Created by Celio Ferreira on 17/10/22.
//

import UIKit

class HomeVC: UIViewController {
    
    var homeScreen: HomeScreen?
    
    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .yellow
    }
   

}
