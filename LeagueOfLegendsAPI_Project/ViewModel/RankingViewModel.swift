//
//  RankingViewModel.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/27.
//

import Foundation
import RxSwift

class RankingViewModel: BaseViewModel {
    
    let rankers: PublishSubject<[Ranker]> = .init()
    var currentRankers: [Ranker] = []
    
    let summoner: PublishSubject<Summoner> = .init()
    
    private let service: ServiceProtocol

    init(service: ServiceProtocol) {
        self.service = service
        super.init()
    }
    
    func getRankingList() {
        loading.onNext(true)
        service.getRanking().subscribe(
            onNext: { [unowned self] rankersData in
                loading.onNext(false)
                currentRankers = rankersData
                rankers.onNext(currentRankers)
            },
            onError: { [unowned self] error in
                loading.onNext(false)
                errorMessage.onNext(error.localizedDescription)
            }
        ).disposed(by: disposeBag)
    }
    
    func getSummoner(summonerName: String) {
        loading.onNext(true)
        service.getSummoner(summonerName: summonerName).subscribe(
            onNext: { [unowned self] summonerData in
                loading.onNext(false)
                summoner.onNext(summonerData)
            },
            onError: { [unowned self] error in
                loading.onNext(false)
                errorMessage.onNext(error.localizedDescription)
            }
        ).disposed(by: disposeBag)
    }
    
}
 
