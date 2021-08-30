//
//  RankingViewController.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/27.
//

import UIKit
import Pure
import RxSwift
import RxCocoa
import Then

class RankingViewController: BaseViewController, FactoryModule {
    
    struct Dependency {
        let viewModel: RankingViewModel
    }
    
    let viewModel: RankingViewModel
    
    let selfView = RankingView()
    
    required init(dependency: Dependency, payload: ()) {
        viewModel = dependency.viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        viewModel.getRankingList()
    }
    
    override func configureUI() {
        view.addSubview(selfView)
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        selfView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        selfView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        selfView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        selfView.tableView.rowHeight  = 55
        selfView.tableView.separatorStyle = .singleLine
        selfView.tableView.separatorColor = Constant.Color.MY_BLUE
        selfView.tableView.backgroundColor = .systemBackground
        
        selfView.tableView.delegate = self
        selfView.tableView.dataSource = self
    }
    
    func bind() {
        viewModel.rankers.subscribe(
            onNext: { _ in
                self.selfView.tableView.reloadData()
            }
        ).disposed(by: disposeBag)
        
        viewModel.summoner.subscribe(
            onNext: { summoner in
                self.coordinator?.getSummonerComplete(summoner: summoner)
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
