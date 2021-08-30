//
//  SimpleViewController.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/17.
//

import UIKit
import RxSwift

class SimpleViewController: BaseViewController {
    
    var summoner: Summoner
    var matchInfo: MatchInfo
    
    var myTeam: Team = Team()
    var enemyTeam: Team = Team()
    
    var myTeamList: [Participant] = []
    var enemyTeamList: [Participant] = []

    var myTeamNameList: [String] = []
    var enemyTeamNameList: [String] = []

    let selfView = SimpleView()
    
    init(summoner: Summoner, matchInfo: MatchInfo) {
        self.summoner = summoner
        self.matchInfo = matchInfo
        
        var participantIndex = 0
        for identities in matchInfo.participantIdentities {
            if identities.player?.accountId == summoner.accountId {
                participantIndex = identities.participantId!-1
            }
        }
        
        let teamId = matchInfo.participants[participantIndex].teamId
        for team in matchInfo.teams {
            if teamId == team.teamId {
                myTeam = team
            } else {
                enemyTeam = team
            }
        }
        
        var count = 0
        for participant in matchInfo.participants {
            if teamId == participant.teamId {
                myTeamList.append(participant)
                myTeamNameList.append((matchInfo.participantIdentities[count].player?.summonerName)!)
            } else {
                enemyTeamList.append(participant)
                enemyTeamNameList.append((matchInfo.participantIdentities[count].player?.summonerName)!)
            }
            count += 1
        }
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        view.addSubview(selfView)
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height / 9).isActive = true
        selfView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        selfView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        selfView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        selfView.myTeamCollectionView.register(SimpleCell.self, forCellWithReuseIdentifier: SimpleCell.identifier)
        selfView.myTeamCollectionView.delegate = self
        selfView.myTeamCollectionView.dataSource = self
        selfView.myTeamCollectionView.reloadData()
        //selfView.myTeamCollectionView.transform = CGAffineTransform(scaleX: 1, y: -1)

        selfView.enemyTeamCollectionView.register(SimpleCell.self, forCellWithReuseIdentifier: SimpleCell.identifier)
        selfView.enemyTeamCollectionView.delegate = self
        selfView.enemyTeamCollectionView.dataSource = self
        selfView.enemyTeamCollectionView.reloadData()
        
        selfView.settingView(myTeam: myTeam, enemyTeam: enemyTeam)
        
        selfView.myTeamInfoView.banCollectionView.register(BanCell.self, forCellWithReuseIdentifier: BanCell.identifier)
        selfView.myTeamInfoView.banCollectionView.delegate = self
        selfView.myTeamInfoView.banCollectionView.dataSource = self
      
        selfView.enemyTeamInfoView.banCollectionView.register(BanCell.self, forCellWithReuseIdentifier: BanCell.identifier)
        selfView.enemyTeamInfoView.banCollectionView.delegate = self
        selfView.enemyTeamInfoView.banCollectionView.dataSource = self
    }
    
}
