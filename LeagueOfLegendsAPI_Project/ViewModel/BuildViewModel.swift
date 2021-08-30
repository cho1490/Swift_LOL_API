//
//  BuildViewModel.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/25.
//

import Foundation
import RxSwift

class BuildViewModel: BaseViewModel {
    
    let matchFrame: PublishSubject<[MatchFrame]> = .init()
    
    private let service: ServiceProtocol
    
    override init() {
        service = Service()
    }
    
    func getMatchTimeline(matchID: Double) {
        loading.onNext(true)
        service.getMatchTimeline(matchID: matchID).subscribe(
            onNext: { [unowned self] matchFrameData in
                loading.onNext(false)
                matchFrame.onNext(matchFrameData)
            },
            onError: { [unowned self] error in
                loading.onNext(false)
                errorMessage.onNext(error.localizedDescription)
            }
        ).disposed(by: disposeBag)
    }
    
}
