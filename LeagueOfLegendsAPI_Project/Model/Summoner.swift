//
//  Summoner.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/07/27.
//

struct Summoner: Codable {

    var id: String
    var accountId: String
    var puuid: String
    var name: String
    var profileIconId: Int
    var revisionDate: Double
    var summonerLevel: Double

}
