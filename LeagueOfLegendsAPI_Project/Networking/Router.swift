//
//  Router.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/07/27.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    case getSummonerBySummonerName(term: String)
    case getRanking
    case getLeagueBySummonerID(term: String)
    case getMatchListByAccountID(term: String)
    case getMatchInfoByMatchID(term: Double)
    case getMatchTimelineByMatchID(term: Double)
    case getChampionMasteryBySummonerID(term: String)
    
    var baseURL: URL {
        return URL(string: API.BASE_URL)!
    }
    
    var method: HTTPMethod {
        switch self {
        case .getSummonerBySummonerName: return .get
        case .getRanking: return .get
        case .getLeagueBySummonerID: return .get
        case .getMatchListByAccountID: return .get
        case .getMatchInfoByMatchID: return .get
        case .getMatchTimelineByMatchID: return .get
        case .getChampionMasteryBySummonerID: return .get
        }
    }
    
    var endPoint: String {
        switch self {
        case let .getSummonerBySummonerName(term): return "\(API.SUMMONER_V4)\(API.B9)\(term)"
        case .getRanking: return "\(API.LEAGUE_EXP_V4)\(API.A3)\(API.B3)"
        case let .getLeagueBySummonerID(term): return "\(API.LEAGUE_V4)\(API.E4)\(term)"
        case let .getMatchListByAccountID(term): return "\(API.MATCH_V4)\(API.B6)\(term)"
        case let .getMatchInfoByMatchID(term): return "\(API.MATCH_V4)\(API.A6)\(String(Int(round(term))))"
        case let .getMatchTimelineByMatchID(term): return "\(API.MATCH_V4)\(API.C6)\(String(Int(round(term))))"
        case let .getChampionMasteryBySummonerID(term): return "\(API.CHAMPION_MASTERY_V4)\(API.A1)\(term)"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        print("Router.asURLRequest()")
        let url = baseURL.appendingPathComponent(endPoint)
        print("Router.asURLRequest().url : \(url)")
        var request = URLRequest(url: url)
        request.method = method
        
        return request
    }
    
}
