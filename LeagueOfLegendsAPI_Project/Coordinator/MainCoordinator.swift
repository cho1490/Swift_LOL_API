//
//  MainCoordinator.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/02.
//

import UIKit
import Pure

class MainCoordinator: Coordinator, FactoryModule {
        
    struct Dependency {
        let mainTabBarControllerFactory: () -> MainTabBarConroller
        let homeViewControllerFactory: () -> HomeViewController
        let rankingViewConrollerFactory: () -> RankingViewController
        let summonerDetailTabBarControllerFactory: (Summoner) -> SummonerDetailTabBarController
        let matchRecordViewControllerFactory: (Summoner) -> MatchRecordViewController
        let matchInfoDetailTabmanViewControllerFactory: (GetMatchInfoViewModel, Summoner) -> MatchInfoDetailTabmanViewController
        let championMasteryViewControllerFactory: (Summoner) -> ChampionMasteryViewController
    }
   
    var navigationController: UINavigationController?
    
    let mainTabBarControllerFactory: () -> MainTabBarConroller
    let homeViewControllerFactory: () -> HomeViewController
    let rankingViewConrollerFactory: () -> RankingViewController
    let summonerDetailTabBarControllerFactory: (Summoner) -> SummonerDetailTabBarController
    let matchRecordViewControllerFactory: (Summoner) -> MatchRecordViewController
    let matchInfoDetailTabmanViewControllerFactory: (GetMatchInfoViewModel, Summoner) -> MatchInfoDetailTabmanViewController
    let championMasteryViewControllerFactory: (Summoner) -> ChampionMasteryViewController
    
    required init(dependency: Dependency, payload: ()) {
        mainTabBarControllerFactory = dependency.mainTabBarControllerFactory
        homeViewControllerFactory = dependency.homeViewControllerFactory
        rankingViewConrollerFactory = dependency.rankingViewConrollerFactory
        
        summonerDetailTabBarControllerFactory = dependency.summonerDetailTabBarControllerFactory
        matchRecordViewControllerFactory = dependency.matchRecordViewControllerFactory
        matchInfoDetailTabmanViewControllerFactory = dependency.matchInfoDetailTabmanViewControllerFactory
        championMasteryViewControllerFactory = dependency.championMasteryViewControllerFactory
    }
    
    func start() {
        let mainTabBarController = mainTabBarControllerFactory()
        
        let homeViewController = homeViewControllerFactory()
        homeViewController.tabBarItem.selectedImage = UIImage(systemName: "house")
        homeViewController.tabBarItem.title = "홈"
        homeViewController.tabBarItem.image = UIImage(systemName: "house.fill")
        homeViewController.coordinator = self
        
        let rankingViewController = rankingViewConrollerFactory()
        rankingViewController.tabBarItem.selectedImage = UIImage(systemName: "person.3")
        rankingViewController.tabBarItem.title = "랭킹"
        rankingViewController.tabBarItem.image = UIImage(systemName: "person.3.fill")
        rankingViewController.coordinator = self
        
        mainTabBarController.viewControllers = [homeViewController, rankingViewController]
        
        navigationController?.pushViewController(mainTabBarController, animated: false)
    }
    
    func getSummonerComplete(summoner: Summoner) {
        let tabBarController = summonerDetailTabBarControllerFactory(summoner)
        tabBarController.coordinator = self
        
        let matchRecordViewController = matchRecordViewControllerFactory(summoner)
        matchRecordViewController.tabBarItem.selectedImage = UIImage(systemName: "square.grid.3x3")
        matchRecordViewController.tabBarItem.title = "대전 기록"
        matchRecordViewController.tabBarItem.image = UIImage(systemName: "square.grid.3x3.fill")
        matchRecordViewController.coordinator = self
        
        let championMasteryViewController = championMasteryViewControllerFactory(summoner)
        championMasteryViewController.tabBarItem.selectedImage = UIImage(systemName: "book")
        championMasteryViewController.tabBarItem.title = "숙련도"
        championMasteryViewController.tabBarItem.image = UIImage(systemName: "book.fill")
        championMasteryViewController.coordinator = self
        
        tabBarController.viewControllers = [matchRecordViewController, championMasteryViewController]
        
        navigationController?.pushViewController(tabBarController, animated: true)
    }
    
    func matchRecordCellTapped(viewModel: GetMatchInfoViewModel, summoner: Summoner) {
        let matchInfoDetailTabmanViewController = matchInfoDetailTabmanViewControllerFactory(viewModel, summoner)
        matchInfoDetailTabmanViewController.coordinator = self
        navigationController?.pushViewController(matchInfoDetailTabmanViewController, animated: true)
    }
    
}
