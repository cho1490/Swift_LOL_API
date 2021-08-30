//
//  HomeViewModel.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/07/25.
//

import Foundation
import RxSwift

class HomeViewModel: BaseViewModel {
    
    // 검색했을 때 사용자 맞는지 아닌지 나중에 사용하자
    let isUser: BehaviorSubject<Bool> = .init(value: false)
    let summoner: PublishSubject<Summoner> = .init()
    
    private let service: ServiceProtocol
    
    init(service: ServiceProtocol) {
        self.service = service
        super.init()
    }
    
    func viewDidLoad() {
        Version.loading.subscribe(onNext: { [unowned self] loading in
            self.loading.onNext(loading)
        }).disposed(by: disposeBag)
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
 
