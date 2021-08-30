//
//  MatchInfoDetailViewController.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/14.
//

import UIKit
import Tabman
import Pageboy

class MatchInfoDetailTabmanViewController: TabmanViewController {

    var coordinator: MainCoordinator?
    
    var viewControllers: Array<UIViewController> = []
    
    let viewModel: GetMatchInfoViewModel
    let summoner: Summoner
    
    let selfView = MatchInfoDetailTabmanView()
  
    init(viewModel: GetMatchInfoViewModel, summoner: Summoner) {
        self.viewModel = viewModel
        self.summoner = summoner
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(selfView)
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        selfView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        selfView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        selfView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        bind()
        viewModel.getMatchInfo(matchID: viewModel.match.gameId!)
    }
    
    func bind() {
        viewModel.matchInfo.subscribe(
            onNext: { [unowned self] matchInfo in
                viewControllers.append(SimpleViewController(summoner: summoner, matchInfo: matchInfo))
                viewControllers.append(GraphViewController(summoner: summoner, matchInfo: matchInfo))
                viewControllers.append(BuildViewController(summoner: summoner, matchInfo: matchInfo))
                self.dataSource = self
                let bar = TMBar.ButtonBar()
                bar.layout.transitionStyle = .snap
                addBar(bar, dataSource: self, at: .navigationItem(item: self.navigationItem))
            }
        ).disposed(by: viewModel.disposeBag)
        
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
        ).disposed(by: viewModel.disposeBag)
        
        viewModel.loading.subscribe(
            onNext: { loading in
                self.selfView.loadingView.isHidden = !loading
                self.selfView.removeFromSuperview()
            }
        ).disposed(by: viewModel.disposeBag)
    }
    
}
