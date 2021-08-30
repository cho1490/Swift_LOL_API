//
//  RankingList.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/28.
//

struct Ranker: Codable {
    
    /// var leagueId: String?
    /// var queueType: String?
    var tier: String?
    var rank: String?
    var summonerId: String?
    var summonerName: String?
    var leaguePoints: Int?
    var wins: Int?
    var losses: Int?
    var veteran: Bool?
    var inactive: Bool?
    var freshBlood: Bool?
    var hotStreak: Bool?
    
}
