//
//  MainTabbarController.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/27.
//

import UIKit

class MainTabBarConroller: UITabBarController {

    var coordinator: MainCoordinator?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
