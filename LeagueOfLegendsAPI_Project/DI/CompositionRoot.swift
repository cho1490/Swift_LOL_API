//
//  CompositionRoot.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/03.
//

struct AppDependency {
    let mainCoordinator: MainCoordinator
}

extension AppDependency {
    
    static func reslove() -> AppDependency {
        let service: ServiceProtocol = Service()
        
        let mainTabBarControllerFactory: () -> MainTabBarConroller = {
            return .init()
        }
        
        let homeViewControllerFactory: () -> HomeViewController = {
            let viewModel = HomeViewModel(service: service)
            return .init(dependency: .init(viewModel: viewModel))
        }
        
        let rankingViewControllerFactory: () -> RankingViewController = {
            let viewModel = RankingViewModel(service: service)
            return .init(dependency: .init(viewModel: viewModel))
        }
        
        let summonerDetailTabBarControllerFactory: (Summoner) -> SummonerDetailTabBarController = { summoner in
            return .init(summoner: summoner)
        }
        
        let matchRecordViewControllerFactory: (Summoner) -> MatchRecordViewController = { summoner in
            let viewModel = MatchRecordViewModel(service: service)
            return .init(dependency: .init(viewModel: viewModel, summoner: summoner))
        }
        
        let matchInfoDetailTabmanViewControllerFactory: (GetMatchInfoViewModel, Summoner) -> MatchInfoDetailTabmanViewController = { viewModel, summoner in
            return .init(viewModel: viewModel, summoner: summoner)
        }
        
        let championMasteryViewControllerFactory: (Summoner) -> ChampionMasteryViewController = {
            summoner in
            let viewModel = ChampionMasteryViewModel(service: service)
            return .init(dependency: .init(viewModel: viewModel, summoner: summoner))
        }
        
        let mainCoordinator: MainCoordinator = .init(dependency: .init(mainTabBarControllerFactory: mainTabBarControllerFactory, homeViewControllerFactory: homeViewControllerFactory, rankingViewConrollerFactory: rankingViewControllerFactory, summonerDetailTabBarControllerFactory: summonerDetailTabBarControllerFactory, matchRecordViewControllerFactory: matchRecordViewControllerFactory,matchInfoDetailTabmanViewControllerFactory: matchInfoDetailTabmanViewControllerFactory, championMasteryViewControllerFactory: championMasteryViewControllerFactory))
        
        return .init(mainCoordinator: mainCoordinator)
    }

}
