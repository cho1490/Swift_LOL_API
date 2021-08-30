//
//  MatchRecordViewModel.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/09.
//

import Foundation
import RxSwift

class MatchRecordViewModel: BaseViewModel {
    
    let leagueList: PublishSubject<[League]> = .init()
    let matchList: PublishSubject<[GetMatchInfoViewModel]> = .init()
    var currentMatchList: [GetMatchInfoViewModel] = []
    
    private let service: ServiceProtocol
    
    init(service: ServiceProtocol) {
        self.service = service
        super.init()
    }
    
    func getLeague(summonerID: String) {
        loading.onNext(true)
        service.getLeague(summonerID: summonerID).subscribe(
            onNext: { [unowned self] leagueListData in
                loading.onNext(false)
                leagueList.onNext(leagueListData)
            },
            onError: { [unowned self] error in
                loading.onNext(false)
                errorMessage.onNext(error.localizedDescription)
            }
        ).disposed(by: disposeBag)
    }
    
    func getMatchList(accountID: String) {
        loading.onNext(true)
        service.getMatchList(accountID: accountID).subscribe(
            onNext: { [unowned self] matchListData in
                loading.onNext(false)
                currentMatchList = matchListData.map { GetMatchInfoViewModel(match: $0) }
                matchList.onNext(currentMatchList)
            },
            onError: { [unowned self] error in
                loading.onNext(false)
                errorMessage.onNext(error.localizedDescription)
            }
        ).disposed(by: disposeBag)
    }
    
}
