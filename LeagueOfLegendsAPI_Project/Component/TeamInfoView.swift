//
//  TeamInfoView.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/24.
//

import UIKit
import Then

class TeamInfoView: UIView {
    
    let baronImage = UIImageView().then {
        $0.image = UIImage(named: "Nashor")
        $0.widthAnchor.constraint(equalToConstant: 20).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    let baronValueLabel = UILabel().then {
        $0.font = $0.font.withSize(10)
    }
    
    let dragonImage = UIImageView().then {
        $0.image = UIImage(named: "Dragon")
        $0.widthAnchor.constraint(equalToConstant: 20).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    let dragonValueLabel = UILabel().then {
        $0.font = $0.font.withSize(10)
    }
    
    let riftHeraldImage = UIImageView().then {
        $0.image = UIImage(named: "RiftHerald")
        $0.widthAnchor.constraint(equalToConstant: 20).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    let riftHeraldValueLabel = UILabel().then {
        $0.font = $0.font.withSize(10)
    }
    
    let towerImage = UIImageView().then {
        $0.image = UIImage(named: "Tower")
        $0.widthAnchor.constraint(equalToConstant: 20).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    let towerValueLabel = UILabel().then {
        $0.font = $0.font.withSize(10)
    }
    
    let defaultChampionImageView = UIImageView().then {
        $0.image = UIImage(named: "Champion")
        $0.widthAnchor.constraint(equalToConstant: 20).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    let banCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = .systemBackground
        return cv
    }()

    
    func configureUI(team: Team) {
        addSubview(baronImage)
        baronImage.translatesAutoresizingMaskIntoConstraints = false
        baronImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        baronImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        
        addSubview(baronValueLabel)
        baronValueLabel.translatesAutoresizingMaskIntoConstraints = false
        baronValueLabel.centerYAnchor.constraint(equalTo: baronImage.centerYAnchor).isActive = true
        baronValueLabel.leftAnchor.constraint(equalTo: baronImage.rightAnchor, constant: 3).isActive = true
        
        addSubview(dragonImage)
        dragonImage.translatesAutoresizingMaskIntoConstraints = false
        dragonImage.centerYAnchor.constraint(equalTo: baronImage.centerYAnchor).isActive = true
        dragonImage.leftAnchor.constraint(equalTo: baronValueLabel.rightAnchor, constant: 7).isActive = true
        
        addSubview(dragonValueLabel)
        dragonValueLabel.translatesAutoresizingMaskIntoConstraints = false
        dragonValueLabel.centerYAnchor.constraint(equalTo: dragonImage.centerYAnchor).isActive = true
        dragonValueLabel.leftAnchor.constraint(equalTo: dragonImage.rightAnchor, constant: 3).isActive = true
        
        addSubview(riftHeraldImage)
        riftHeraldImage.translatesAutoresizingMaskIntoConstraints = false
        riftHeraldImage.centerYAnchor.constraint(equalTo: dragonImage.centerYAnchor).isActive = true
        riftHeraldImage.leftAnchor.constraint(equalTo: dragonValueLabel.rightAnchor, constant: 7).isActive = true
        
        addSubview(riftHeraldValueLabel)
        riftHeraldValueLabel.translatesAutoresizingMaskIntoConstraints = false
        riftHeraldValueLabel.centerYAnchor.constraint(equalTo: riftHeraldImage.centerYAnchor).isActive = true
        riftHeraldValueLabel.leftAnchor.constraint(equalTo: riftHeraldImage.rightAnchor, constant: 3).isActive = true
        
        addSubview(towerImage)
        towerImage.translatesAutoresizingMaskIntoConstraints = false
        towerImage.centerYAnchor.constraint(equalTo: riftHeraldImage.centerYAnchor).isActive = true
        towerImage.leftAnchor.constraint(equalTo: riftHeraldValueLabel.rightAnchor, constant: 7).isActive = true
        
        addSubview(towerValueLabel)
        towerValueLabel.translatesAutoresizingMaskIntoConstraints = false
        towerValueLabel.centerYAnchor.constraint(equalTo: towerImage.centerYAnchor).isActive = true
        towerValueLabel.leftAnchor.constraint(equalTo: towerImage.rightAnchor, constant: 3).isActive = true

        addSubview(defaultChampionImageView)
        defaultChampionImageView.translatesAutoresizingMaskIntoConstraints = false
        defaultChampionImageView.leftAnchor.constraint(equalTo: centerXAnchor).isActive = true
        defaultChampionImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(banCollectionView)
        banCollectionView.translatesAutoresizingMaskIntoConstraints = false
        banCollectionView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        banCollectionView.leftAnchor.constraint(equalTo: defaultChampionImageView.rightAnchor, constant: 5).isActive = true
        banCollectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: -5).isActive = true
        banCollectionView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        banCollectionView.backgroundColor = .clear
        
        settingView(team: team)
    }
    
    func settingView(team: Team) {
        backgroundColor = Constant.Color.MY_GREY
        
        baronValueLabel.text = "\(team.baronKills ?? -1)"
        dragonValueLabel.text = "\(team.dragonKills ?? -1)"
        riftHeraldValueLabel.text = "\(team.riftHeraldKills ?? -1)"
        towerValueLabel.text = "\(team.towerKills ?? -1)"
        
        banCollectionView.reloadData()
    }
    
}
