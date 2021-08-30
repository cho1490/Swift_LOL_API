//
//  Service.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/07/27.
//

import Foundation
import RxSwift

protocol ServiceProtocol {
    func getSummoner(summonerName: String) -> Observable<Summoner>
    func getRanking() -> Observable<[Ranker]>
    func getLeague(summonerID: String) -> Observable<[League]>
    func getMatchList(accountID: String) -> Observable<[Match]>
    func getMatchInfo(matchID: Double) -> Observable<MatchInfo>
    func getMatchTimeline(matchID: Double) -> Observable<[MatchFrame]>
    func getChampionMastery(summonerID: String) -> Observable<[ChampionMastery]>
}

class Service: ServiceProtocol {
    
    // MARK: - getSummoner
    
    func getSummoner(summonerName: String) -> Observable<Summoner> {
        print("Service.getSummoner()")
        return Observable.create { (observer) -> Disposable in
            self.getSummoner(summonerName: summonerName) { (error, summoner) in
                if let error = error {
                    observer.onError(error)
                }
                
                if let summoner = summoner {
                    observer.onNext(summoner)
                }
                
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
    
    private func getSummoner(summonerName: String, completion:@escaping((Error?, Summoner?) -> Void)) {
        print("Service.getSummoner() _ private")
        AlamofireManager
            .shared
            .session
            .request(Router.getSummonerBySummonerName(term: summonerName))
            .responseDecodable(of: Summoner.self) { response in
                if let error = response.error {
                    return completion(error, nil)
                }
                
                if let summoner = response.value {
                    return completion(nil, summoner)
                }
            }
    }
    
    // MARK: - getRanking
    func getRanking() -> Observable<[Ranker]> {
        print("Service.getRanking")
        return Observable.create { (observer) -> Disposable in
            self.getRanking() { (error, rankers) in
                if let error = error {
                    observer.onError(error)
                }
                
                if let rankers = rankers {
                    observer.onNext(rankers)
                }
                
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
    
    private func getRanking(completion:@escaping((Error?, [Ranker]?) -> Void)) {
        print("Serviec.getRanking _ private")
        AlamofireManager
            .shared
            .session
            .request(Router.getRanking)
            .responseDecodable(of: [Ranker].self) { response in
                if let error = response.error {
                    return completion(error, nil)
                }
                
                if let rankers = response.value {
                    return completion(nil, rankers)
                }
            }
    }
    
    // MARK: - getLeague
    
    func getLeague(summonerID: String) -> Observable<[League]> {
        print("Service.getLeague()")
        return Observable.create { (observer) -> Disposable in
            self.getLeague(summonerID: summonerID) { (error, leagues) in
                if let error = error {
                    observer.onError(error)
                }
                
                if let leagues = leagues {
                    observer.onNext(leagues)
                }
                
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
    
    private func getLeague(summonerID: String, completion:@escaping((Error?, [League]?) -> Void)) {
        print("Service.getLeague() _ private")
        AlamofireManager
            .shared
            .session
            .request(Router.getLeagueBySummonerID(term: summonerID))
            .responseDecodable(of: [League].self) { response in
                if let error = response.error {
                    return completion(error, nil)
                }
                
                if let leagues = response.value {
                    return completion(nil, leagues)
                }
            }
    }
    
    // MARK: - getMatchList
    
    func getMatchList(accountID: String) -> Observable<[Match]> {
        print("Service.getMatchList()")
        return Observable.create { (observer) -> Disposable in
            self.getMatchList(accountId: accountID) { (error, matches) in
                if let error = error {
                    observer.onError(error)
                }
                
                if let matches = matches {
                    observer.onNext(matches)
                }
                
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
    
    private func getMatchList(accountId: String, completion:@escaping((Error?, [Match]?) -> Void)) {
        print("Service.getMatchList() _ private")
        AlamofireManager
            .shared
            .session
            .request(Router.getMatchListByAccountID(term: accountId))
            .responseDecodable(of: MatchList.self) { response in
                if let error = response.error {
                    return completion(error, nil)
                }
                
                if let matches = response.value?.matches {
                    return completion(nil, matches)
                }
            }
    }
    
    // MARK: - getMatchInfo
    
    func getMatchInfo(matchID: Double) -> Observable<MatchInfo> {
        print("Service.getMatchInfo()")
        return Observable.create { (observer) -> Disposable in
            self.getMatchInfo(matchId: matchID) { (error, matchInfo) in
                if let error = error {
                    observer.onError(error)
                }
                
                if let matchInfo = matchInfo {
                    observer.onNext(matchInfo)
                }
                
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
    
    private func getMatchInfo(matchId: Double, completion:@escaping((Error?, MatchInfo?) -> Void)) {
        print("Service.getMatchInfo() _ private")
        AlamofireManager
            .shared
            .session
            .request(Router.getMatchInfoByMatchID(term: matchId))
            .responseDecodable(of: MatchInfo.self) { response in
                if let error = response.error {
                    return completion(error, nil)
                }
                
                if let matchInfo = response.value {
                    return completion(nil, matchInfo)
                }
            }
    }
    
    // MARK: - getMatchTimeline
    
    func getMatchTimeline(matchID: Double) -> Observable<[MatchFrame]> {
        print("Service.getMatchTimeline()")
        return Observable.create{ (observer) -> Disposable in
            self.getMatchTimeline(matchID: matchID) { (error, matchTimeline) in
                if let error = error {
                    observer.onError(error)
                }
                
                if let matchTimeline = matchTimeline {
                    observer.onNext(matchTimeline)
                }
                
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
    
    private func getMatchTimeline(matchID: Double, completion:@escaping((Error?, [MatchFrame]?) -> Void)) {
        print("Service.getMatchTimeline() _ private")
        AlamofireManager
            .shared
            .session
            .request(Router.getMatchTimelineByMatchID(term: matchID))
            .responseDecodable(of: MatchTimeline.self) { response in
                if let error = response.error {
                    return completion(error, nil)
                }
                
                if let matchTimeline = response.value?.frames {
                    return completion(nil, matchTimeline)
                }
            }
    }
    
    // MARK: - getChampionMastery
    
    func getChampionMastery(summonerID: String) -> Observable<[ChampionMastery]> {
        print("Service.getChampionMastery()")
        return Observable.create { (observer) -> Disposable in
            self.getChampionMastery(summonerID: summonerID) { (error, championMasteries) in
                if let error = error {
                    observer.onError(error)
                }
                
                if let championMasteries = championMasteries {
                    observer.onNext(championMasteries)
                }
                
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
    
    private func getChampionMastery(summonerID: String, completion:@escaping((Error?, [ChampionMastery]?) -> Void)) {
        print("Service.getMatchList() _ private")
        AlamofireManager
            .shared
            .session
            .request(Router.getChampionMasteryBySummonerID(term: summonerID))
            .responseDecodable(of: [ChampionMastery].self) { response in
                if let error = response.error {
                    return completion(error, nil)
                }
                
                if let championMasteries = response.value {
                    return completion(nil, championMasteries)
                }
            }
    }
    
    
}
