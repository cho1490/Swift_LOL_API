//
//  SummonerInfoView.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/16.
//

import UIKit
import Then
import SDWebImage

class SummonerInfoView: UIView {

    let profileIcon = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    
    let levelView = UIView().then {
        $0.backgroundColor = Constant.Color.MY_BACKGROUND
    }
    
    let levelLabel = UILabel().then {
        $0.font = $0.font.withSize(10)
        $0.textColor = .black
    }
    
    let nameLabel = UILabel().then {
        $0.font = $0.font.withSize(17)
    }
    
    let soloRankTierView = TierView()
    
    let freeRankTierView = TierView()
    
    func configureUI(summoner: Summoner, leagueList: [League]) {
        let a = frame.width / 17 * 16
        
        addSubview(profileIcon)
        profileIcon.translatesAutoresizingMaskIntoConstraints = false
        profileIcon.topAnchor.constraint(equalTo: topAnchor).isActive = true
        profileIcon.leftAnchor.constraint(equalTo: leftAnchor, constant: (frame.width - a) / 2).isActive = true
        profileIcon.widthAnchor.constraint(equalToConstant: 60).isActive = true
        profileIcon.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        addSubview(levelView)
        levelView.translatesAutoresizingMaskIntoConstraints = false
        levelView.centerYAnchor.constraint(equalTo: profileIcon.bottomAnchor).isActive = true
        levelView.centerXAnchor.constraint(equalTo: profileIcon.centerXAnchor).isActive = true
        levelView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        levelView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        levelView.layer.cornerRadius = 10
        
        addSubview(levelLabel)
        levelLabel.translatesAutoresizingMaskIntoConstraints = false
        levelLabel.centerXAnchor.constraint(equalTo: levelView.centerXAnchor).isActive = true
        levelLabel.centerYAnchor.constraint(equalTo: levelView.centerYAnchor).isActive = true
        
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerYAnchor.constraint(equalTo: profileIcon.centerYAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: profileIcon.rightAnchor, constant: 20).isActive = true
        
        addSubview(soloRankTierView)
        soloRankTierView.translatesAutoresizingMaskIntoConstraints = false
        soloRankTierView.topAnchor.constraint(equalTo: levelView.bottomAnchor, constant: 10).isActive = true
        soloRankTierView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        soloRankTierView.widthAnchor.constraint(equalToConstant: (a - 5) / 2).isActive = true
        soloRankTierView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        soloRankTierView.layer.borderColor = Constant.Color.MY_BACKGROUND.cgColor
        soloRankTierView.layer.borderWidth = 1
        soloRankTierView.configureUI(number: 1)
        
        addSubview(freeRankTierView)
        freeRankTierView.translatesAutoresizingMaskIntoConstraints = false
        freeRankTierView.topAnchor.constraint(equalTo: soloRankTierView.topAnchor).isActive = true
        freeRankTierView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        freeRankTierView.widthAnchor.constraint(equalToConstant: (a - 5) / 2).isActive = true
        freeRankTierView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        freeRankTierView.layer.borderColor = Constant.Color.MY_BACKGROUND.cgColor
        freeRankTierView.layer.borderWidth = 1
        freeRankTierView.configureUI(number: 2)
        
        for league in leagueList {
            if league.queueType == "RANKED_SOLO_5x5" {
                soloRankTierView.settingView(league: league)
            } else if league.queueType == "RANKED_FLEX_SR" {
                freeRankTierView.settingView(league: league)
            }
        }
       
        settingView(summoner: summoner, leagueList: leagueList)
    }
    
    private func settingView(summoner: Summoner, leagueList: [League]) {        
        if let url = URL(string: DATA_DRAGON.getProfileIcon.getURL(subString: String(summoner.profileIconId))) {
            profileIcon.sd_setImage(with: url, completed: nil)
        }
        
        levelLabel.text = "\(Int(summoner.summonerLevel))"
      
        nameLabel.text = summoner.name
    }
    
}
