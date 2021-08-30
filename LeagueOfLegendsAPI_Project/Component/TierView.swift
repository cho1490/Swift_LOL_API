//
//  TierView.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/16.
//

import UIKit
import Then

class TierView: UIView {
    
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.image = UIImage(named: "UNRANKED")
    }
    
    let whatLabel = UILabel().then {
        $0.font = $0.font.withSize(9)
    }
    
    let tierLabel = UILabel().then {
        $0.text = "UnRanked"
        $0.font = $0.font.withSize(11)
    }
    
    let pointLabel = UILabel().then {
        $0.font = $0.font.withSize(8)
    }
    
    let winLabel = UILabel().then {
        $0.font = $0.font.withSize(9)
    }
    
    let loseLabel = UILabel().then {
        $0.font = $0.font.withSize(9)
    }
    
    let percentLabel = UILabel().then {
        $0.font = $0.font.withSize(9)
    }
    
    func configureUI(number: Int) {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        if number == 1 {
            whatLabel.text = "솔로 랭크"
        } else if number == 2 {
            whatLabel.text = "자유 랭크"
        }
        
        addSubview(whatLabel)
        whatLabel.translatesAutoresizingMaskIntoConstraints = false
        whatLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7).isActive = true
        whatLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 10).isActive = true
 
        addSubview(tierLabel)
        tierLabel.translatesAutoresizingMaskIntoConstraints = false
        tierLabel.topAnchor.constraint(equalTo: whatLabel.bottomAnchor, constant: 3).isActive = true
        tierLabel.leftAnchor.constraint(equalTo: whatLabel.leftAnchor).isActive = true
    }
    
    func settingView(league: League) {
        imageView.image = UIImage(named: league.tier)
        
        addSubview(whatLabel)
        whatLabel.translatesAutoresizingMaskIntoConstraints = false
        whatLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7).isActive = true
        whatLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 10).isActive = true
 
        addSubview(tierLabel)
        tierLabel.translatesAutoresizingMaskIntoConstraints = false
        tierLabel.topAnchor.constraint(equalTo: whatLabel.bottomAnchor, constant: 3).isActive = true
        tierLabel.leftAnchor.constraint(equalTo: whatLabel.leftAnchor).isActive = true
        tierLabel.text = "\(league.tier) \(league.rank)"
        
        addSubview(pointLabel)
        pointLabel.translatesAutoresizingMaskIntoConstraints = false
        pointLabel.topAnchor.constraint(equalTo: tierLabel.bottomAnchor, constant: 1).isActive = true
        pointLabel.leftAnchor.constraint(equalTo: whatLabel.leftAnchor).isActive = true
        pointLabel.text = "\(league.leaguePoints)LP"
        
        addSubview(winLabel)
        winLabel.translatesAutoresizingMaskIntoConstraints = false
        winLabel.topAnchor.constraint(equalTo: pointLabel.bottomAnchor, constant: 5).isActive = true
        winLabel.leftAnchor.constraint(equalTo: whatLabel.leftAnchor).isActive = true
        winLabel.text = "\(league.wins)승"
        
        addSubview(loseLabel)
        loseLabel.translatesAutoresizingMaskIntoConstraints = false
        loseLabel.topAnchor.constraint(equalTo: winLabel.topAnchor).isActive = true
        loseLabel.leftAnchor.constraint(equalTo: winLabel.rightAnchor, constant: 3).isActive = true
        loseLabel.text = "\(league.losses)패"
        
        addSubview(percentLabel)
        percentLabel.translatesAutoresizingMaskIntoConstraints = false
        percentLabel.topAnchor.constraint(equalTo: winLabel.topAnchor).isActive = true
        percentLabel.leftAnchor.constraint(equalTo: loseLabel.rightAnchor, constant: 3).isActive = true
        percentLabel.text = "\(Int(100.0 / Double(league.wins + league.losses) * Double(league.wins)))%"
    }
    
}
