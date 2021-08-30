//
//  RankingCell.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/28.
//

import UIKit
import Then

class RankingCell: UITableViewCell {
    
    static let identifier = "RankingCellIdentifier"
    
    let rankingNumberLabel = UILabel().then {
        $0.font = $0.font.withSize(13)
    }
    
    let summonerNameLabel = UILabel().then {
        $0.font = $0.font.withSize(15)
    }

    let tierImage = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.widthAnchor.constraint(equalToConstant: 35).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    let view = UIView().then {
        $0.backgroundColor = Constant.Color.MY_BLUE
    }
    
    let tierLabel = UILabel().then {
        $0.font = $0.font.withSize(13)
        $0.textColor = .white
    }
    
    let leaguePointLabel = UILabel().then {
        $0.font = $0.font.withSize(13)
        $0.textColor = .white
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI(index: Int, ranker: Ranker) {
        addSubview(rankingNumberLabel)
        rankingNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        rankingNumberLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        rankingNumberLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
       
        addSubview(summonerNameLabel)
        summonerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        summonerNameLabel.leftAnchor.constraint(equalTo: rankingNumberLabel.rightAnchor, constant: 10).isActive = true
        summonerNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        view.widthAnchor.constraint(equalToConstant: 60).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        view.layer.cornerRadius = 10
        
        addSubview(tierLabel)
        tierLabel.translatesAutoresizingMaskIntoConstraints = false
        tierLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tierLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 5).isActive = true
        
        addSubview(leaguePointLabel)
        leaguePointLabel.translatesAutoresizingMaskIntoConstraints = false
        leaguePointLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        leaguePointLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5).isActive = true
        
        addSubview(tierImage)
        tierImage.translatesAutoresizingMaskIntoConstraints = false
        tierImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -80).isActive = true
        tierImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        settingCell(index: index, ranker: ranker)
    }
    
    func settingCell(index: Int, ranker: Ranker) {
        rankingNumberLabel.text = "\(index+1)위"
        summonerNameLabel.text = "\(ranker.summonerName ?? "")"
        leaguePointLabel.text = "\(ranker.leaguePoints ?? -1) LP"
        var tier = ""
        switch ranker.tier {
        case "CHALLENGER":
            tier = "C"
        case "GRANDMASTER":
            tier = "GM"
        case "MASTER":
            tier = "M"
        case "DIAMOND":
            tier = "D"
        case "PLATINUM":
            tier = "P"
        case "GOLD":
            tier = "G"
        case "SILVER":
            tier = "S"
        case "BRONZE":
            tier = "B"
        case "IRON":
            tier = "I"
        default:
            tier = ""
        }
        tierLabel.text = "\(tier) \(ranker.rank ?? "-1")"
        tierImage.image = UIImage(named: ranker.tier!)
    }
    
}

