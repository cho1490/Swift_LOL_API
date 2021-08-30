//
//  ChampionMasteryCell.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/14.
//

import UIKit
import Then
import SDWebImage

class ChampionMasteryCell: UICollectionViewCell {
    
    static let identifier = "ChampionMasteryCellIdentifier"
    
    let championImage = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    
    let masteryImage = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    
    let championNameLabel = UILabel().then {
        $0.font = $0.font.withSize(10)
        $0.textAlignment = .center
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI(championMastery: ChampionMastery) {
        addSubview(championImage)
        championImage.translatesAutoresizingMaskIntoConstraints = false
        championImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        championImage.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        championImage.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        championImage.heightAnchor.constraint(equalToConstant: frame.width).isActive = true
        
        addSubview(masteryImage)
        masteryImage.translatesAutoresizingMaskIntoConstraints = false
        masteryImage.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        masteryImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        masteryImage.widthAnchor.constraint(equalToConstant: frame.height/5).isActive = true
        masteryImage.heightAnchor.constraint(equalToConstant: frame.height/5).isActive = true
        
        addSubview(championNameLabel)
        championNameLabel.translatesAutoresizingMaskIntoConstraints = false
        championNameLabel.topAnchor.constraint(equalTo: championImage.bottomAnchor).isActive = true
        championNameLabel.leftAnchor.constraint(equalTo: masteryImage.rightAnchor).isActive = true
        championNameLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        championNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        settingCell(championMastery: championMastery)
    }
     
    private func settingCell(championMastery: ChampionMastery) {
        if let url = URL(string: DATA_DRAGON.getChampion.getURL(subString: Converter.getChampionName(championID: championMastery.championId))) {
            self.championImage.sd_setImage(with: url, completed: nil)
        }
        
        switch championMastery.championLevel {
        case 1:
            masteryImage.image = UIImage(named: "ChampionMastery1")
        case 2:
            masteryImage.image = UIImage(named: "ChampionMastery2")
        case 3:
            masteryImage.image = UIImage(named: "ChampionMastery3")
        case 4:
            masteryImage.image = UIImage(named: "ChampionMastery4")
        case 5:
            masteryImage.image = UIImage(named: "ChampionMastery5")
        case 6:
            masteryImage.image = UIImage(named: "ChampionMastery6")
        case 7:
            masteryImage.image = UIImage(named: "ChampionMastery7")
        default:
            print(championMastery.championLevel)
        }
  
        championNameLabel.text = Converter.getChampionName(championID: championMastery.championId)
    
    }
    
}
