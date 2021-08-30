//
//  MatchInfoDetailView.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/14.
//

import UIKit

class SimpleView: BaseView {
    
    let myTeamCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = .systemBackground
        return cv
    }()
    
    let enemyTeamCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = .systemBackground
        
        return cv
    }()
    
    let myTeamInfoView = TeamInfoView()
    
    let enemyTeamInfoView = TeamInfoView()
    
    let myTeamBoxView = UIView()
    
    let enemyTeamBoxView = UIView()
    
    override func configureUI() {
        addSubview(myTeamBoxView)
        myTeamBoxView.translatesAutoresizingMaskIntoConstraints = false
        myTeamBoxView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        myTeamBoxView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        myTeamBoxView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        myTeamBoxView.bottomAnchor.constraint(equalTo: centerYAnchor, constant:  -10).isActive = true
        myTeamBoxView.layer.cornerRadius = 20
        
        addSubview(enemyTeamBoxView)
        enemyTeamBoxView.translatesAutoresizingMaskIntoConstraints = false
        enemyTeamBoxView.topAnchor.constraint(equalTo: centerYAnchor, constant: 10).isActive = true
        enemyTeamBoxView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        enemyTeamBoxView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        enemyTeamBoxView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        enemyTeamBoxView.layer.cornerRadius = 20
        
        addSubview(myTeamInfoView)
        myTeamInfoView.translatesAutoresizingMaskIntoConstraints = false
        myTeamInfoView.leftAnchor.constraint(equalTo: myTeamBoxView.leftAnchor, constant: 5).isActive = true
        myTeamInfoView.rightAnchor.constraint(equalTo: myTeamBoxView.rightAnchor, constant: -5).isActive = true
        myTeamInfoView.bottomAnchor.constraint(equalTo: myTeamBoxView.bottomAnchor, constant: -5).isActive = true
        myTeamInfoView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        myTeamInfoView.layer.cornerRadius = 15
        
        addSubview(enemyTeamInfoView)
        enemyTeamInfoView.translatesAutoresizingMaskIntoConstraints = false
        enemyTeamInfoView.topAnchor.constraint(equalTo: enemyTeamBoxView.topAnchor, constant: 5).isActive = true
        enemyTeamInfoView.leftAnchor.constraint(equalTo: enemyTeamBoxView.leftAnchor, constant: 5).isActive = true
        enemyTeamInfoView.rightAnchor.constraint(equalTo: enemyTeamBoxView.rightAnchor, constant: -5).isActive = true
        enemyTeamInfoView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        enemyTeamInfoView.layer.cornerRadius = 15
        
        addSubview(myTeamCollectionView)
        myTeamCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myTeamCollectionView.topAnchor.constraint(equalTo: myTeamBoxView.topAnchor, constant: 5).isActive = true
        myTeamCollectionView.leftAnchor.constraint(equalTo: myTeamBoxView.leftAnchor, constant: 5).isActive = true
        myTeamCollectionView.rightAnchor.constraint(equalTo: myTeamBoxView.rightAnchor, constant: -5).isActive = true
        myTeamCollectionView.bottomAnchor.constraint(equalTo: myTeamInfoView.topAnchor, constant: -10).isActive = true
        myTeamCollectionView.backgroundColor = .clear
        myTeamCollectionView.transform = CGAffineTransform(scaleX: 1, y: -1)
        
        addSubview(enemyTeamCollectionView)
        enemyTeamCollectionView.translatesAutoresizingMaskIntoConstraints = false
        enemyTeamCollectionView.topAnchor.constraint(equalTo: enemyTeamInfoView.bottomAnchor, constant: 10).isActive = true
        enemyTeamCollectionView.leftAnchor.constraint(equalTo: enemyTeamBoxView.leftAnchor, constant: 5).isActive = true
        enemyTeamCollectionView.rightAnchor.constraint(equalTo: enemyTeamInfoView.rightAnchor, constant: -5).isActive = true
        enemyTeamCollectionView.bottomAnchor.constraint(equalTo: enemyTeamBoxView.bottomAnchor, constant: -5).isActive = true
        enemyTeamCollectionView.backgroundColor = .clear
    }
    
    func settingView(myTeam: Team, enemyTeam: Team) {
        myTeamInfoView.configureUI(team: myTeam)
        enemyTeamInfoView.configureUI(team: enemyTeam)
        
        if myTeam.win == "Win" {
            myTeamBoxView.backgroundColor = Constant.Color.MY_BLUE
            enemyTeamBoxView.backgroundColor = Constant.Color.MY_RED
        } else if myTeam.win == "Fail" {
            myTeamBoxView.backgroundColor = Constant.Color.MY_RED
            enemyTeamBoxView.backgroundColor = Constant.Color.MY_BLUE
        } else {
            myTeamBoxView.backgroundColor = Constant.Color.MY_GREY
            enemyTeamBoxView.backgroundColor = Constant.Color.MY_GREY
        }
    }

}
