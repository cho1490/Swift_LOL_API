//
//  MatchTimeLine.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/25.
//

struct MatchTimeline: Codable {
    var frames: [MatchFrame]?
}

struct MatchFrame: Codable {
    var events: [MatchEvent]?
}

struct MatchEvent: Codable {
    var type: String // SKILL_LEVEL_UP
    var skillSlot: Int?
    var participantId: Int?
}
