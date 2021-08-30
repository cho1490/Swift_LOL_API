//
//  ChampionMasteryViewController.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/10.
//

import UIKit
import Pure

class ChampionMasteryViewController: BaseViewController, FactoryModule {
    
    struct Dependency {
        let viewModel: ChampionMasteryViewModel
        let summoner: Summoner
    }
    
    let viewModel: ChampionMasteryViewModel
    let summoner: Summoner
    
    let selfView = ChampionMasteryView()
    
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
        viewModel.getChampionMastery(summonerID: summoner.id)
    }
    
    override func configureUI() {
        view.addSubview(selfView)
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        selfView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        selfView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        selfView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        selfView.collectionView.register(ChampionMasteryCell.self, forCellWithReuseIdentifier: ChampionMasteryCell.identifier)
        
        selfView.collectionView.delegate = self
        selfView.collectionView.dataSource = self
    }
    
    func bind() {
        viewModel.championMasteryList.subscribe(
            onNext: { _ in
                self.selfView.collectionView.reloadData()
            }
        ).disposed(by: disposeBag)
        
        viewModel.errorMessage.subscribe(
            onNext: { error in
                // print() -> customErrorView 만들기
                print("HomeViewController Error : \(error)")
            }
        ).disposed(by: disposeBag)
        
        viewModel.loading.subscribe(
            onNext: { loading in
                self.selfView.loadingView.isHidden = !loading
            }
        ).disposed(by: disposeBag)
    }
}
