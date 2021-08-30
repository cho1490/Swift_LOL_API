//
//  DataDragon.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/07/27.
//

import Foundation

enum DATA_DRAGON {
    
    case getProfileIcon
    case getChampion
    case getSpell
    case getRune
    case getRuneFragment
    case getItem
    
    static let VERSION_URL = "https://ddragon.leagueoflegends.com/realms/kr.json"
    
    static var VERSION = ""
    static let SERVER = "/ko_KR"
    static let BASE_URL = "https://ddragon.leagueoflegends.com/cdn"
  
    enum SET_TYPE {
        static let IMG_TYPE = "/img"
    }
    
    enum GET_TYPE {
        static let PNG_TYPE = ".png"
    }
    
    static let PROFILE_ICON = "/profileicon/"
    static let CHAMPION = "/champion/"
    static let SPELL = "/spell/"
    static let RUNE = "/perk-images/Styles/"
    static let RUNE_FRAGMENT = "/perk-images/StatMods/"
    static let ITEM = "/item/"

    func getURL(subString: String) -> String {
        switch self {
        case .getProfileIcon:
            return DATA_DRAGON.BASE_URL + "/" + DATA_DRAGON.VERSION + DATA_DRAGON.SET_TYPE.IMG_TYPE + DATA_DRAGON.PROFILE_ICON + subString + DATA_DRAGON.GET_TYPE.PNG_TYPE
        case .getChampion:
            return DATA_DRAGON.BASE_URL + "/" + DATA_DRAGON.VERSION + DATA_DRAGON.SET_TYPE.IMG_TYPE + DATA_DRAGON.CHAMPION + subString + DATA_DRAGON.GET_TYPE.PNG_TYPE
        case .getSpell:
            return DATA_DRAGON.BASE_URL + "/" + DATA_DRAGON.VERSION + DATA_DRAGON.SET_TYPE.IMG_TYPE + DATA_DRAGON.SPELL + subString + DATA_DRAGON.GET_TYPE.PNG_TYPE
        case .getRune:
            return DATA_DRAGON.BASE_URL + DATA_DRAGON.SET_TYPE.IMG_TYPE + DATA_DRAGON.RUNE + subString + DATA_DRAGON.GET_TYPE.PNG_TYPE
        case .getRuneFragment:
            return DATA_DRAGON.BASE_URL + DATA_DRAGON.SET_TYPE.IMG_TYPE + DATA_DRAGON.RUNE_FRAGMENT + subString + DATA_DRAGON.GET_TYPE.PNG_TYPE
        case .getItem:
            return DATA_DRAGON.BASE_URL + "/" + DATA_DRAGON.VERSION + DATA_DRAGON.SET_TYPE.IMG_TYPE + DATA_DRAGON.ITEM + subString + DATA_DRAGON.GET_TYPE.PNG_TYPE
        }
    }
    
}
