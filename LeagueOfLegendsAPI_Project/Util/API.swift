//
//  API.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/07/27.
//

import Foundation

enum API {
    // MARK: - BASE
    
    static let KEY = "HI"
 
    static let BASE_URL = "https://kr.api.riotgames.com"
    
    // MARK: - CHAMPION_MASTERY_V4
    
    static let CHAMPION_MASTERY_V4 = "/lol/champion-mastery/v4"
    
    /// Get all champion mastery entries sorted by number of champion points descending
    static let A1 = "/champion-masteries/by-summoner/" // + {encryptedSummonerId}
    
    /// Get a champion mastery by player ID and champion ID
    static let B1 = "/by-champion/" // + {championId}
    
    /// Get a player's total champion mastery score, which is the sum of individual champion mastery levels
    static let C1 = "/scores/by-summoner/" // + {encryptedSummonerId}
    
    // MARK: - CHAMPION_V3
    
    static let CHAMPION_V3 = "/lol/platform/v3"
    
    /// Returns champion rotations, including free-to-play and low-level free-to-play rotations (REST)
    static let A2 = "/champion-rotations"
        
    // MARK: - LEAGUE_EXP_V4
    
    static let LEAGUE_EXP_V4 = "/lol/league-exp/v4"
    
    /// Get all the league entries
    static let A3 = "/entries/" // + {queue}/{tier}/{division}
    
    // fixed route
    static let B3 = "RANKED_SOLO_5x5/CHALLENGER/I"
    // MARK: - LEAGUE_V4

    static let LEAGUE_V4 = "/lol/league/v4"

    /// Get the challenger league for given queue
    static let A4 = "/challengerleagues/by-queue/" // + {queue}
    
    /// Get the grandmaster league of a specific queue
    static let B4 = "grandmasterleagues/by-queue/" // + {queue}
    
    /// Get the master league for given queue
    static let C4 = "/masterleagues/by-queue/" // + {queue}
    
    /// Get league with given ID, including inactive entries
    static let D4 = "/leagues/" // + {leagueId}
    
    /// Get league entries in all queues for a given summoner ID
    static let E4 = "/entries/by-summoner/" // + {encryptedSummonerId}
    
    // MARK: - LOL_STATUS_V4
    
    static let LOL_STATUS_V4 = "/lol/status/v4"
    
    /// Get League of Legends status for the given platform
    static let A5 = "/platform-data"
    
    // MARK: - MATCH_V4 ( deprecated on 2021년 8월 23 )
    
    static let MATCH_V4 = "/lol/match/v4"
    
    /// Get match by game ID
    static let A6 = "/matches/" // + {gameId}
    
    /// Get matchlist for games played on given account ID and platform ID and filtered using given filter parameters, if any
    static let B6 = "/matchlists/by-account/" // + {encryptedAccountId}
     
    /// Get match timeline by match ID
    static let C6 = "/timelines/by-match/" // + {matchId}
    
    // MARK: - MATCH_V5
    
    static let MATCH_V5 = "/lol/match/v5"
    
    /// Get a list of match ids by puuid
    static let A7 = "/matches/by-puuid/{puuid}/ids"
    
    /// Get a match by match id
    static let B7 = "/matches/{matchId}"
    
    /// Get a match timeline by match id
    static let C7 = "/matches/{matchId}/timeline"
    
    // MARK: - SPECTATOR_V4
    
    static let SPECTATOR_V4 = "/lol/spectator/v4"

    /// Get current game information for the given summoner ID
    static let A8 = "/active-games/by-summoner/" // + {encryptedSummonerId}
    
    /// Get list of featured games
    static let B8 = "/featured-games"
    
    // MARK: - SUMMONER_V4
    
    static let SUMMONER_V4 = "/lol/summoner/v4"
    
    /// Get a summoner by account ID
    static let A9 = "/summoners/by-account/" // + {encryptedAccountId}
    
    /// Get a summoner by summoner name
    static let B9 = "/summoners/by-name/" // + {summonerName}
    
    /// Get a summoner by PUUID
    static let C9 = "/summoners/by-puuid/" // + {encryptedPUUID}
    
    /// Get a summoner by summoner ID
    static let D9 = "/summoners/" // + {encryptedSummonerId}
    
}
