//
//  SummonerDetailTabBarController.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/09.
//

import UIKit

class SummonerDetailTabBarController: UITabBarController {

    var coordinator: MainCoordinator?
    let summoner: Summoner
    
    init(summoner: Summoner) {
        self.summoner = summoner
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
