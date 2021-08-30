//
//  MatchRecordCellViewModel.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/12.
//

import Foundation
import RxSwift

class GetMatchInfoViewModel: BaseViewModel {
    
    let matchInfo: PublishSubject<MatchInfo> = .init()
    
    private let service: ServiceProtocol
    let match: Match
    
    init(match: Match) {
        service = Service()
        self.match = match
    }
    
    func getMatchInfo(matchID: Double) {
        loading.onNext(true)
        service.getMatchInfo(matchID: matchID).subscribe(
            onNext: { [unowned self] matchInfoData in
                loading.onNext(false)
                matchInfo.onNext(matchInfoData)
            },
            onError: { [unowned self] error in
                loading.onNext(false)
                errorMessage.onNext(error.localizedDescription)
            }
        ).disposed(by: disposeBag)
    }
    
}
