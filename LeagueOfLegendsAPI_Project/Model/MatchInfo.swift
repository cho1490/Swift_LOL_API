//
//  MatchInfo.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/07/27.
//

struct MatchInfo: Codable {

    var gameId: Double
    var platformId: String
    var gameCreation: Double
    var gameDuration: Double
    var queueId: Int
    var mapId: Int
    var seasonId: Int
    var gameVersion: String
    var gameMode: String
    var gameType: String
    var teams: [Team]
    var participants: [Participant]
    var participantIdentities: [ParticipantIdentity]

}

struct Team: Codable{
    
    var teamId: Int?
    var win: String?
    /// var firstBlood: Bool?
    /// var firsttower: Bool?
    /// var firstInhibitor: Bool?
    /// var firstBaron: Bool?
    /// var firstDragon: Bool?
    /// var firstRiftHerald: Bool?
    var towerKills: Int?
    var inhibitorKills: Int?
    var baronKills: Int?
    var dragonKills: Int?
    /// var vilemawkills: Int? /// 3x3 map boss
    var riftHeraldKills: Int?
    /// var dominionVictoryScore: Int?
    var bans: [Ban]?
    
}

struct Ban: Codable {
    
    var championId: Int?
    var pickTurn: Int?
    
}

struct Participant: Codable {
    
    var participantId: Int?
    var teamId: Int?
    var championId: Int?
    var spell1Id: Int?
    var spell2Id: Int?
    var stats: Stat?
    // var timeline: ParticipantTimeLine?
    
}

struct Stat: Codable {
    
    var participantId: Int?
    var win: Bool?
    var item0: Int?
    var item1: Int?
    var item2: Int?
    var item3: Int?
    var item4: Int?
    var item5: Int?
    var item6: Int?
    var kills: Int?
    var deaths: Int?
    var assists: Int?
    /// largestKillingSpree : 최대 연속처치
    /// largestMultiKill : 최대 다중킬
    /// killingSprees : 죽지 않고 처치한 횟수
    var longestTimeSpentLiving: Int?
    var doubleKills: Int?
    var tripleKills: Int?
    var quadraKills: Int?
    var pentaKills: Int?
    var unrealKills: Int?
    var totalDamageDealt: Double?
    /// magicDamageDealt : 총 마법피해량
    /// physicalDamageDealt : 총 물리피해량
    /// trueDamageDealt : 총 고정피해량
    /// largestCriticalStrike : 치명타 횟수
    var totalDamageDealtToChampions: Double?
    /// magicDamageDealtToChampions : 챔피언에게 가한 총 마법 피해량
    /// physicalDamageDealtToChampions : 챔피언에게 가한 총 물리 피해량
    /// trueDamageDealtToChampions : 챔피언에게 가한 총 고정 피해량
    var totalHeal: Double?
    /// totalUnitsHealed : 총 챔피언 자체 회복량
    /// damageSelfMitigated : 총 받은피해 감소량
    /// damageDealtToObjectives : 오브젝트(ex.용,바위게,바론)에 가한 피해량
    /// damageDealtToTurrets : 포탑에 가한 피해량
    var visionScore: Double?
    /// timeCCingOthers : cc기 시간
    var totalDamageTaken: Double?
    /// magicalDamageTaken : 총 받은 마법피해량
    /// physicalDamageTaken : 총 받은 물리피해량
    /// trueDamageTaken : 총 받은 고정피해량
    var goldEarned: Int?
    /// goldSpent : 사용한 골드
    var turretKills: Int?
    /// inhibitorKills : 억제기 부순 갯수
    var totalMinionsKilled: Int?
    /// neutralMinionsKilled : 총 처치한 중립 몬스터
    /// neutralMinionsKilledTeamJungle : 총 처치한 아군 중립몬스터
    /// neutralMinionsKilledEnemyJungle : 총 처치한 적군 중립몬스터
    /// totalTimeCrowdControlDealt : 총 사용한 군중제어기(cc)사용 시간
    var champLevel: Int?
    var visionWardsBoughtInGame: Int?
    /// sightWardsBoughtInGame : 시야석 구매 횟수
    var wardsPlaced: Int?
    var wardsKilled: Int?
    var firstBloodKill: Bool?
    var firstBloodAssist: Bool?
    var firstTowerKill: Bool?
    var firstTowerAssist: Bool?
    var firstInhibitorKill: Bool?
    var firstInhibitorAssist: Bool?
    
    var perk0: Int?
    var perk1: Int?
    var perk2: Int?
    var perk3: Int?
    var perk4: Int?
    var perk5: Int?
    var perkPrimaryStyle: Int?
    var perkSubStyle: Int?
    var statPerk0: Int?
    var statPerk1: Int?
    var statPerk2: Int?
    
}

struct ParticipantIdentity: Codable {
    var participantId: Int?
    var player: Player?
}

struct Player: Codable {
    
    var platformId: String?
    var accountId: String?
    var summonerName: String?
    var summonerId: String?
    /// var currentPlatformId: String?
    /// var currentAccountId: String?
    var matchHistoryUri: String?
    var profileIcon: Int?
    
}

