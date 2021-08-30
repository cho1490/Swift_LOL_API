//
//  ChampionMasteryViewModel.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/10.
//

import Foundation
import RxSwift

class ChampionMasteryViewModel: BaseViewModel {
    
    let championMasteryList: PublishSubject<[ChampionMastery]> = .init()
    var currentChampionMasteryList: [ChampionMastery] = []
    
    private let service: ServiceProtocol
    
    init(service: ServiceProtocol) {
        self.service = service
        super.init()
    }
    
    func getChampionMastery(summonerID: String) {
        loading.onNext(true)
        service.getChampionMastery(summonerID: summonerID).subscribe(
            onNext: { [unowned self] championMasteryListData in
                loading.onNext(false)
                currentChampionMasteryList = championMasteryListData
                championMasteryList.onNext(currentChampionMasteryList)
            },
            onError: { [unowned self] error in
                loading.onNext(false)
                errorMessage.onNext(error.localizedDescription)
            }
        ).disposed(by: disposeBag)
    }
    
}
