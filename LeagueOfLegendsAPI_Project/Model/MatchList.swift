//
//  MatchList.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/07/27.
//

struct MatchList: Codable {
    
    var matches: [Match]
    var startIndex: Int
    var endIndex: Int
    var totalGames: Int
    
}

struct Match: Codable {
    
    var platformId: String?
    var gameId: Double?
    var champion: Int?
    var queue: Int?
    var season: Int?
    var timestamp: Double?
    var role: String?
    var lane: String?
    
}
