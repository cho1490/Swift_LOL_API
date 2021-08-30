//
//  AppCoordinator.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/07/27.
//

import UIKit

protocol Coordinator  {
    
    var navigationController: UINavigationController? { get set }
    
    func start()
    
}
