//
//  ChampionNameConverter.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/07/26.
//

import Foundation

class Converter {
    
    // MARK: - getChampionName()
    static func getChampionName(championID: Int) -> String {
        switch championID {
        case 266:
            return "Aatrox"
        case 412:
            return "Thresh"
        case 23:
            return "Tryndamere"
        case 79:
            return "Gragas"
        case 69:
            return "Cassiopeia"
        case 136:
            return "AurelionSol"
        case 13:
            return "Ryze"
        case 78:
            return "Poppy"
        case 14:
            return "Sion"
        case 1:
            return "Annie"
        case 202:
            return "Jhin"
        case 43:
            return "Karma"
        case 111:
            return "Nautilus"
        case 240:
            return "Kled"
        case 99:
            return "Lux"
        case 103:
            return "Ahri"
        case 2:
            return "Olaf"
        case 112:
            return "Viktor"
        case 34:
            return "Anivia"
        case 27:
            return "Singed"
        case 86:
            return "Garen"
        case 127:
            return "Lissandra"
        case 57:
            return "Maokai"
        case 25:
            return "Morgana"
        case 28:
            return "Evelynn"
        case 105:
            return "Fizz"
        case 74:
            return "Heimerdinger"
        case 238:
            return "Zed"
        case 68:
            return "Rumble"
        case 82:
            return "Mordekaiser"
        case 37:
            return "Sona"
        case 96:
            return "KogMaw"
        case 55:
            return "Katarina"
        case 117:
            return "Lulu"
        case 22:
            return "Ashe"
        case 30:
            return "Karthus"
        case 12:
            return "Alistar"
        case 122:
            return "Darius"
        case 67:
            return "Vayne"
        case 110:
            return "Varus"
        case 77:
            return "Udyr"
        case 89:
            return "Leona"
        case 126:
            return "Jayce"
        case 134:
            return "Syndra"
        case 80:
            return "Pantheon"
        case 92:
            return "Riven"
        case 121:
            return "Khazix"
        case 42:
            return "Corki"
        case 268:
            return "Azir"
        case 51:
            return "Caitlyn"
        case 76:
            return "Nidalee"
        case 85:
            return "Kennen"
        case 3:
            return "Galio"
        case 45:
            return "Veigar"
        case 432:
            return "Bard"
        case 150:
            return "Gnar"
        case 90:
            return "Malzahar"
        case 104:
            return "Graves"
        case 254:
            return "Vi"
        case 10:
            return "Kayle"
        case 39:
            return "Irelia"
        case 64:
            return "LeeSin"
        case 420:
            return "Illaoi"
        case 60:
            return "Elise"
        case 106:
            return "Volibear"
        case 20:
            return "Nunu"
        case 4:
            return "TwistedFate"
        case 24:
            return "Jax"
        case 102:
            return "Shyvana"
        case 429:
            return "Kalista"
        case 36:
            return "DrMundo"
        case 427:
            return "Ivern"
        case 131:
            return "Diana"
        case 63:
            return "Brand"
        case 113:
            return "Sejuani"
        case 8:
            return "Vladimir"
        case 154:
            return "Zac"
        case 421:
            return "RekSai"
        case 133:
            return "Quinn"
        case 84:
            return "Akali"
        case 163:
            return "Taliyah"
        case 18:
            return "Tristana"
        case 120:
            return "Hecarim"
        case 15:
            return "Sivir"
        case 236:
            return "Lucian"
        case 107:
            return "Rengar"
        case 19:
            return "Warwick"
        case 72:
            return "Skarner"
        case 54:
            return "Malphite"
        case 157:
            return "Yasuo"
        case 101:
            return "Xerath"
        case 17:
            return "Teemo"
        case 75:
            return "Nasus"
        case 58:
            return "Renekton"
        case 119:
            return "Draven"
        case 35:
            return "Shaco"
        case 50:
            return "Swain"
        case 91:
            return "Talon"
        case 40:
            return "Janna"
        case 115:
            return "Ziggs"
        case 245:
            return "Ekko"
        case 61:
            return "Orianna"
        case 114:
            return "Fiora"
        case 9:
            return "Fiddlesticks"
        case 31:
            return "Chogath"
        case 33:
            return "Rammus"
        case 7:
            return "Leblanc"
        case 16:
            return "Soraka"
        case 26:
            return "Zilean"
        case 56:
            return "Nocturne"
        case 222:
            return "Jinx"
        case 83:
            return "Yorick"
        case 6:
            return "Urgot"
        case 203:
            return "Kindred"
        case 21:
            return "MissFortune"
        case 62:
            return "MonkeyKing"
        case 53:
            return "Blitzcrank"
        case 98:
            return "Shen"
        case 201:
            return "Braum"
        case 5:
            return "XinZhao"
        case 29:
            return "Twitch"
        case 11:
            return "MasterYi"
        case 44:
            return "Taric"
        case 32:
            return "Amumu"
        case 41:
            return "Gangplank"
        case 48:
            return "Trundle"
        case 38:
            return "Kassadin"
        case 161:
            return "Velkoz"
        case 143:
            return "Zyra"
        case 267:
            return "Nami"
        case 59:
            return "JarvanIV"
        case 81:
            return "Ezreal"
        case 350:
            return "Yuumi"
        case 145:
            return "Kaisa"
        case 518:
            return "Neeko"
        case 142:
            return "Zoe"
        case 498:
            return "Xayah"
        case 517:
            return "Sylas"
        case 141:
            return "Kayn"
        case 516:
            return "Ornn"
        case 555:
            return "Pyke"
        case 164:
            return "Camille"
        case 246:
            return "Qiyana"
        case 497:
            return "Rakan"
        case 777:
            return "Yone"
        case 876:
            return "Lillia"
        case 235:
            return "Senna"
        case 875:
            return "Sett"
        case 523:
            return "Aphelios"
        case 223:
            return "TahmKench"
        case 360:
            return "Samira"
        case 147:
            return "Seraphine"
        case 526:
            return "Rell"
        case 234:
            return "Viego"
        case 887:
            return "Gwen"
        case 166:
            return "Akshan"
        default:
            return "championID ? : \(championID)"
        }
    }
    
    // MARK: - getSummonerSpellName()
    static func getSummonerSpellName(summonerSpellID: Int) -> String {
        switch summonerSpellID {
        case 1:
            return "SummonerBoost"
        case 3:
            return "SummonerExhaust"
        case 4:
            return "SummonerFlash"
        case 6:
            return "SummonerHaste"
        case 7:
            return "SummonerHeal"
        case 11:
            return "SummonerSmite"
        case 12:
            return "SummonerTeleport"
        case 13:
            return "SummonerMana"
        case 14:
            return "SummonerDot"
        case 21:
            return "SummonerBarrier"
        case 30:
            return "SummonerPoroThrow"
        case 31:
            return "SummonerPoroRecall"
        case 32:
            return "SummonerSnowURFSnowball_Mark"
        case 39:
            return "SummonerSnowball"
        default:
            return "summonerID ? : \(summonerSpellID)"
        }
    }
    
    static func getGmaeMode(queueID: Int) -> String {
        switch queueID {
        case 420:
            return "솔로 랭크"
        case 430:
            return "일반"
        case 440:
            return "자유 랭크"
        case 450:
            return "칼바람 나락"
        case 600:
            return "암살자 모드"
        case 610:
            return "암흑의 별"
        case 700:
            return "격전"
        case 820:
            return "봇전(3vs3)"
        case 830:
            return "봇전(입문)"
        case 840:
            return "봇전(초보)"
        case 850:
            return "봇전(중급)"
        case 900:
            return "URF!"
        case 910:
            return "초월 모드"
        case 920:
            return "전설의 포로 왕"
        case 940:
            return "넥서스 시즈"
        case 950:
            return "초토화 봇 모드"
        case 960:
            return "초토화 봇 모드"
        case 980:
            return "침공 모드"
        case 990:
            return "침공 모드"
        case 1010:
            return "URF!"
        case 1020:
            return "단일 모드"
        case 1030:
            return "오디세이"
        case 1040:
            return "오디세이"
        case 1050:
            return "오디세이"
        case 1060:
            return "오디세이"
        case 1070:
            return "오디세이"
        case 1200:
            return "돌격! 넥서스"
        case 1300:
            return "돌격! 넥서스"
        case 1400:
            return "궁극기 모드"
        default:
            return "게임!"
        }
    }
    
    static func getRuneRoute(runeID: Int) -> String {
        switch runeID {
        // 지배
        case 8100:
            return "7200_Domination"
            
        // 지배 핵심 룬
        case 8112:
            return "Domination/Electrocute/Electrocute"
        case 8124:
            return "Domination/Predator/Predator"
        case 8128:
            return "Domination/DarkHarvest/DarkHarvest"
        case 9923:
            return "Domination/HailOfBlades/HailOfBlades"
            
        // 지배 보조 룬
        case 8126:
            return "Domination/CheapShot/CheapShot"
        case 8139:
            return "Domination/TasteOfBlood/GreenTerror_TasteOfBlood"
        case 8143:
            return "Domination/SuddenImpact/SuddenImpact"
            
        case 8136:
            return "Domination/ZombieWard/ZombieWard"
        case 8120:
            return "Domination/GhostPoro/GhostPoro"
        case 8138:
            return "Domination/EyeballCollection/EyeballCollection"
            
        case 8135:
            return "Domination/RavenousHunter/RavenousHunter"
        case 8134:
            return "Domination/IngeniousHunter/IngeniousHunter"
        case 8105:
            return "Domination/RelentlessHunter/RelentlessHunter"
        case 8106:
            return "Domination/UltimateHunter/UltimateHunter"
        
        // 영감
        case 8300:
            return "7203_Whimsy"
            
        // 영감 핵심 룬
        case 8351:
            return "Inspiration/GlacialAugment/GlacialAugment"
        case 8360:
            return "Inspiration/UnsealedSpellbook/UnsealedSpellbook"
        case 8350:
            return "Inspiration/MasterKey/MasterKey"
            
        // 영감 보조 룬
        case 8306:
            return "Inspiration/HextechFlashtraption/HextechFlashtraption"
        case 8304:
            return "Inspiration/MagicalFootwear/MagicalFootwear"
        case 8313:
            return "Inspiration/PerfectTiming/PerfectTiming"
            
        case 8321:
            return "Inspiration/FuturesMarket/FuturesMarket"
        case 8316:
            return "Inspiration/MinionDematerializer/MinionDematerializer"
        case 8345:
            return "Inspiration/BiscuitDelivery/BiscuitDelivery"
        
        case 8347:
            return "Inspiration/CosmicInsight/CosmicInsight"
        case 8410:
            return "Resolve/ApproachVelocity/ApproachVelocity"
        case 8352:
            return "Inspiration/TimeWarpTonic/TimeWarpTonic"
            
        // 정밀
        case 8000:
            return "7201_Precision"
        
        // 정밀 핵심 룬
        case 8005:
            return "Precision/PressTheAttack/PressTheAttack"
        case 8008:
            return "Precision/LethalTempo/LethalTempoTemp"
        case 8021:
            return "Precision/FleetFootwork/FleetFootwork"
        case 8010:
            return "Precision/Conqueror/Conqueror"
       
        // 정밀 보조 룬
        case 9101:
            return "Precision/Overheal"
        case 9111:
            return "Precision/Triumph"
        case 8009:
            return "Precision/PresenceOfMind/PresenceOfMind"
            
        case 9104:
            return "Precision/LegendAlacrity/LegendAlacrity"
        case 9105:
            return "Precision/LegendTenacity/LegendTenacity"
        case 9103:
            return "Precision/LegendBloodline/LegendBloodline"
            
        case 8014:
            return "Precision/CoupDeGrace/CoupDeGrace"
        case 8017:
            return "Precision/CutDown/CutDown"
        case 8299:
            return "Sorcery/LastStand/LastStand"
       
        // 결의
        case 8400:
            return "7204_Resolve"
            
        // 결의 핵심 룬
        case 8437:
            return "Resolve/GraspOfTheUndying/GraspOfTheUndying"
        case 8439:
            return "Resolve/VeteranAftershock/VeteranAftershock"
        case 8465:
            return "Resolve/Guardian/Guardian"
            
        // 결의 보조 룬
        case 8446:
            return "Resolve/Demolish/Demolish"
        case 8463:
            return "Resolve/FontOfLife/FontOfLife"
        case 8401:
            return "Resolve/MirrorShell/MirrorShell"
            
        case 8429:
            return "Resolve/Conditioning/Conditioning"
        case 8444:
            return "Resolve/SecondWind/SecondWind"
        case 8473:
            return "Resolve/BonePlating/BonePlating"
            
        case 8451:
            return "Resolve/Overgrowth/Overgrowth"
        case 8453:
            return "Resolve/Revitalize/Revitalize"
        case 8242:
            return "Sorcery/Unflinching/Unflinching"
            
        // 마법
        case 8200:
            return "7202_Sorcery"
            
        // 마법 핵심 룬
        case 8214:
            return "Sorcery/SummonAery/SummonAery"
        case 8229:
            return "Sorcery/ArcaneComet/ArcaneComet"
        case 8230:
            return "Sorcery/PhaseRush/PhaseRush"
            
        // 마법 보조 룬
        case 8224:
            return "Sorcery/NullifyingOrb/Pokeshield"
        case 8226:
            return "Sorcery/ManaflowBand/ManaflowBand"
        case 8275:
            return "Sorcery/NimbusCloak/6361"
            
        case 8210:
            return "Sorcery/Transcendence/Transcendence"
        case 8234:
            return "Sorcery/Celerity/CelerityTemp"
        case 8233:
            return "Sorcery/AbsoluteFocus/AbsoluteFocus"
            
        case 8237:
            return "Sorcery/Scorch/Scorch"
        case 8232:
            return "Sorcery/Waterwalking/Waterwalking"
        case 8236:
            return "Sorcery/GatheringStorm/GatheringStorm"
            
        // 룬 파편
        case 5001:
            return "StatModsHealthScalingIcon"
        case 5002:
            return "StatModsArmorIcon"
        case 5003:
            return "StatModsMagicResIcon"
        case 5005:
            return "StatModsAttackSpeedIcon"
        case 5007:
            return "StatModsCDRScalingIcon"
        case 5008:
            return "StatModsAdaptiveForceIcon"

        
        default:
            return ""
        }
    }
    
    static func getTimePassed(timeStamp: Double) -> String {
        let date = Date(timeIntervalSince1970: timeStamp / 1000)
        return date.timeAgo()
    }
    
}

extension Date {

    func timeAgo() -> String {

        let secondsAgo = Int(Date().timeIntervalSince(self))

        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        let month = 4 * week

        let quotient: Int
        let unit: String
        if secondsAgo < minute {
            quotient = secondsAgo
            unit = "초"
        } else if secondsAgo < hour {
            quotient = secondsAgo / minute
            unit = "분"
        } else if secondsAgo < day {
            quotient = secondsAgo / hour
            unit = "시간"
        } else if secondsAgo < week {
            quotient = secondsAgo / day
            unit = "일"
        } else if secondsAgo < month {
            quotient = secondsAgo / week
            unit = "주"
        } else {
            quotient = secondsAgo / month
            unit = "달"
        }
        return "\(quotient)\(unit) 전"
    }
}
