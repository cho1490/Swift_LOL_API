//
//  ChampionMasteryInfoView.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/15.
//

import UIKit
import Then

class ChampionMasteryInfoVIew: UIView {
    
    let nameView = UIView().then {
        $0.backgroundColor = Constant.Color.MY_BLUE
    }
    
    let nameLabel = UILabel().then {
        $0.textColor = .white
    }
    
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    
    let levelLabel = UILabel().then {
        $0.text = "레벨"
    }
    
    let levelValueImage = UIImageView()
    
    let lineUnderLevel = UIView().then {
        $0.backgroundColor = .tertiarySystemGroupedBackground
        $0.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
   
    let masteryLabel = UILabel().then {
        $0.text = "숙련도"
    }
    
    let masteryValueLabel = UILabel()
    
    let lineUnderMastery = UIView().then {
        $0.backgroundColor = .tertiarySystemGroupedBackground
        $0.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    let lastPlayLabel = UILabel().then {
        $0.text = "최근 플레이"
    }
    
    let lastPlayValueLabel = UILabel()
    
    let lineUnderLastPlay = UIView().then {
        $0.backgroundColor = .tertiarySystemGroupedBackground
        $0.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    let boxLabel = UILabel().then {
        $0.text = "전리품 상자"
    }
    
    let boxValueLabel = UILabel()
    
    let lineUnderBox = UIView().then {
        $0.backgroundColor = .tertiarySystemGroupedBackground
        $0.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    let tokenLabel = UILabel().then {
        $0.text = "숙련도 토큰"
    }
    
    let tokenValueLabel = UILabel()
    
    func configureUI(championMastery: ChampionMastery) {
        backgroundColor = .systemBackground
        layer.cornerRadius = 8
        layer.masksToBounds = true
        
        addSubview(nameView)
        nameView.translatesAutoresizingMaskIntoConstraints = false
        nameView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        nameView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        nameView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        nameView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerYAnchor.constraint(equalTo: nameView.centerYAnchor).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: nameView.centerXAnchor).isActive = true
        
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        
        addSubview(levelLabel)
        levelLabel.translatesAutoresizingMaskIntoConstraints = false
        levelLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30).isActive = true
        levelLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        
        addSubview(levelValueImage)
        levelValueImage.translatesAutoresizingMaskIntoConstraints = false
        levelValueImage.centerYAnchor.constraint(equalTo: levelLabel.centerYAnchor).isActive = true
        levelValueImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        
        addSubview(lineUnderLevel)
        lineUnderLevel.translatesAutoresizingMaskIntoConstraints = false
        lineUnderLevel.topAnchor.constraint(equalTo: levelValueImage.bottomAnchor, constant: 10).isActive = true
        lineUnderLevel.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        lineUnderLevel.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        
        addSubview(masteryLabel)
        masteryLabel.translatesAutoresizingMaskIntoConstraints = false
        masteryLabel.topAnchor.constraint(equalTo: lineUnderLevel.bottomAnchor, constant: 10).isActive = true
        masteryLabel.leftAnchor.constraint(equalTo: levelLabel.leftAnchor).isActive = true
        
        addSubview(masteryValueLabel)
        masteryValueLabel.translatesAutoresizingMaskIntoConstraints = false
        masteryValueLabel.topAnchor.constraint(equalTo: masteryLabel.topAnchor).isActive = true
        masteryValueLabel.rightAnchor.constraint(equalTo: levelValueImage.rightAnchor).isActive = true
        
        addSubview(lineUnderMastery)
        lineUnderMastery.translatesAutoresizingMaskIntoConstraints = false
        lineUnderMastery.topAnchor.constraint(equalTo: masteryLabel.bottomAnchor, constant: 10).isActive = true
        lineUnderMastery.leftAnchor.constraint(equalTo: lineUnderLevel.leftAnchor).isActive = true
        lineUnderMastery.rightAnchor.constraint(equalTo: lineUnderLevel.rightAnchor).isActive = true
        
        addSubview(lastPlayLabel)
        lastPlayLabel.translatesAutoresizingMaskIntoConstraints = false
        lastPlayLabel.topAnchor.constraint(equalTo: lineUnderMastery.bottomAnchor, constant: 10).isActive = true
        lastPlayLabel.leftAnchor.constraint(equalTo: levelLabel.leftAnchor).isActive = true
        
        addSubview(lastPlayValueLabel)
        lastPlayValueLabel.translatesAutoresizingMaskIntoConstraints = false
        lastPlayValueLabel.topAnchor.constraint(equalTo: lastPlayLabel.topAnchor).isActive = true
        lastPlayValueLabel.rightAnchor.constraint(equalTo: levelValueImage.rightAnchor).isActive = true
        
        addSubview(lineUnderLastPlay)
        lineUnderLastPlay.translatesAutoresizingMaskIntoConstraints = false
        lineUnderLastPlay.topAnchor.constraint(equalTo: lastPlayLabel.bottomAnchor, constant: 10).isActive = true
        lineUnderLastPlay.leftAnchor.constraint(equalTo: lineUnderMastery.leftAnchor).isActive = true
        lineUnderLastPlay.rightAnchor.constraint(equalTo: lineUnderMastery.rightAnchor).isActive = true
    
        addSubview(boxLabel)
        boxLabel.translatesAutoresizingMaskIntoConstraints = false
        boxLabel.topAnchor.constraint(equalTo: lineUnderLastPlay.bottomAnchor, constant: 10).isActive = true
        boxLabel.leftAnchor.constraint(equalTo: lastPlayLabel.leftAnchor).isActive = true
        
        addSubview(boxValueLabel)
        boxValueLabel.translatesAutoresizingMaskIntoConstraints = false
        boxValueLabel.topAnchor.constraint(equalTo: boxLabel.topAnchor).isActive = true
        boxValueLabel.rightAnchor.constraint(equalTo: lastPlayValueLabel.rightAnchor).isActive = true
        
        addSubview(lineUnderBox)
        lineUnderBox.translatesAutoresizingMaskIntoConstraints = false
        lineUnderBox.topAnchor.constraint(equalTo: boxLabel.bottomAnchor, constant: 10).isActive = true
        lineUnderBox.leftAnchor.constraint(equalTo: lineUnderLastPlay.leftAnchor).isActive = true
        lineUnderBox.rightAnchor.constraint(equalTo: lineUnderLastPlay.rightAnchor).isActive = true
        
        addSubview(tokenLabel)
        tokenLabel.translatesAutoresizingMaskIntoConstraints = false
        tokenLabel.topAnchor.constraint(equalTo: lineUnderBox.bottomAnchor, constant: 10).isActive = true
        tokenLabel.leftAnchor.constraint(equalTo: boxLabel.leftAnchor).isActive = true
        
        addSubview(tokenValueLabel)
        tokenValueLabel.translatesAutoresizingMaskIntoConstraints = false
        tokenValueLabel.topAnchor.constraint(equalTo: tokenLabel.topAnchor).isActive = true
        tokenValueLabel.rightAnchor.constraint(equalTo: boxValueLabel.rightAnchor).isActive = true
        
        settingView(championMastery: championMastery)
    }
    
    private func settingView(championMastery: ChampionMastery) {
        nameLabel.text = Converter.getChampionName(championID: championMastery.championId)
        
        if let url = URL(string: DATA_DRAGON.getChampion.getURL(subString: Converter.getChampionName(championID: championMastery.championId))) {
            self.imageView.sd_setImage(with: url, completed: nil)
        }
        
        switch championMastery.championLevel {
        case 1:
            levelValueImage.image = UIImage(named: "ChampionMastery1")
        case 2:
            levelValueImage.image = UIImage(named: "ChampionMastery2")
        case 3:
            levelValueImage.image = UIImage(named: "ChampionMastery3")
        case 4:
            levelValueImage.image = UIImage(named: "ChampionMastery4")
        case 5:
            levelValueImage.image = UIImage(named: "ChampionMastery5")
        case 6:
            levelValueImage.image = UIImage(named: "ChampionMastery6")
        case 7:
            levelValueImage.image = UIImage(named: "ChampionMastery7")
        default:
            print(championMastery.championLevel)
        }
  
        masteryValueLabel.text = "\(championMastery.championPoints) 점"

        lastPlayValueLabel.text = Converter.getTimePassed(timeStamp: championMastery.lastPlayTime)
        
        if championMastery.chestGranted {
            boxValueLabel.text = "획득"
        } else {
            boxValueLabel.text = "미획득"
        }
        
        tokenValueLabel.text = "\(championMastery.tokensEarned) 개"
    }

}
