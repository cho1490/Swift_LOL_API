//
//  MatchRecordViewController.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/09.
//

import UIKit
import Pure

class MatchRecordViewController: BaseViewController, FactoryModule {
    
    struct Dependency {
        let viewModel: MatchRecordViewModel
        let summoner: Summoner
    }
    
    let viewModel: MatchRecordViewModel
    let summoner: Summoner
    
    let selfView = MatchRecordView()
    
    required init(dependency: Dependency, payload: ()) {
        self.viewModel = dependency.viewModel
        self.summoner = dependency.summoner
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        viewModel.getLeague(summonerID: summoner.id)
        viewModel.getMatchList(accountID: summoner.accountId)
    }
    
    override func configureUI() {
        view.addSubview(selfView)
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        selfView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        selfView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        selfView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        selfView.collectionView.register(MatchRecordCell.self, forCellWithReuseIdentifier: MatchRecordCell.identifier)
        
        selfView.collectionView.delegate = self
        selfView.collectionView.dataSource = self
    }
    
    func bind() {
        viewModel.leagueList.subscribe(
            onNext: { leagueListdata in
                self.selfView.summonerInfoView.configureUI(summoner: self.summoner, leagueList: leagueListdata)
            }
        ).disposed(by: disposeBag)
        
        viewModel.matchList.subscribe(
            onNext: { _ in
                self.selfView.collectionView.reloadData()
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

