//
//  TotalViewController.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/17.
//

import UIKit

class BuildViewController: BaseViewController {
    
    var summoner: Summoner
    var matchInfo: MatchInfo
    var participantIndex = 0
    
    let viewModel: BuildViewModel
    let selfView = BuildView()
    
    var skillSlot: [Int] = []
    
    init(summoner: Summoner, matchInfo: MatchInfo) {
        viewModel = BuildViewModel()
        self.summoner = summoner
        self.matchInfo = matchInfo
        
        for identities in matchInfo.participantIdentities {
            if identities.player?.accountId == summoner.accountId {
                participantIndex = identities.participantId!-1
            }
        }
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        viewModel.getMatchTimeline(matchID: matchInfo.gameId)
    }
    
    override func configureUI() {
        view.addSubview(selfView)
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.topAnchor.constraint(equalTo: view.topAnchor, constant: (view.frame.height / 7) + 20).isActive = true
        selfView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        selfView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        selfView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        selfView.collectionView.register(SkillSlotCell.self, forCellWithReuseIdentifier: SkillSlotCell.identifier)
        
        selfView.collectionView.delegate = self
        selfView.collectionView.dataSource = self
        
        selfView.settingView(participant: matchInfo.participants[participantIndex])
    }
    
    func bind() {
        viewModel.matchFrame.subscribe(
            onNext: { [unowned self] matchFrame in
                for frames in matchFrame {
                    for event in frames.events! {
                        if event.type == "SKILL_LEVEL_UP" && event.participantId == participantIndex+1 {
                                skillSlot.append(event.skillSlot!)
                        }
                    }
                }
                selfView.collectionView.reloadData()
            }
        ).disposed(by: disposeBag)
        
        viewModel.errorMessage.subscribe(
            onNext: { [unowned self] error in
                view.addSubview(selfView.errorView)
                selfView.errorView.translatesAutoresizingMaskIntoConstraints = false
                selfView.errorView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
                selfView.errorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                selfView.errorView.heightAnchor.constraint(equalToConstant: 350).isActive = true
                selfView.errorView.widthAnchor.constraint(equalToConstant: view.frame.width - 80).isActive = true
                selfView.errorView.settingView(discription: error)
                UIView.animate(withDuration: 0.2) { [unowned self] in
                    selfView.errorView.alpha = 1
                    selfView.errorView.transform = .identity
                }
            }
        ).disposed(by: disposeBag)
        
        viewModel.loading.subscribe(
            onNext: { loading in
                self.selfView.loadingView.isHidden = !loading
            }
        ).disposed(by: disposeBag)
    }

}
