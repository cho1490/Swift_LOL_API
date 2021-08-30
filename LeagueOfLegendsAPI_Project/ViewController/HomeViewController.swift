//
//  HomeViewController.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/07/25.
//

import UIKit
import Pure
import RxSwift
import RxCocoa
import Then

class HomeViewController: BaseViewController, FactoryModule {
    
    struct Dependency {
        let viewModel: HomeViewModel
    }
    
    let viewModel: HomeViewModel
    
    let selfView = HomeView()
    
    required init(dependency: Dependency, payload: ()) {
        viewModel = dependency.viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeHideKeyboard()
        bind()
        viewModel.viewDidLoad()
        Version.getVersion()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addKeyboardNotification(uiView: selfView)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        removeListeners()
    }
    
    override func configureUI() {
        view.addSubview(selfView)
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        selfView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        selfView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        selfView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func bind() {
        // 검색 시작
        selfView.searchButton.rx.tap.subscribe(
            onNext: {
                self.viewModel.getSummoner(summonerName: self.selfView.summonerNameInputTextField.text ?? "")
            }
        ).disposed(by: disposeBag)
        
        // 검색 중... summoner 데이터를 성공적으로 가져오는지 확인
        viewModel.summoner.subscribe(
            onNext: { summoner in
                self.coordinator?.getSummonerComplete(summoner: summoner)
            }
        ).disposed(by: disposeBag)
        
        // 특수문자 방지, 글자수 제한, 제대로 입력했을 경우 버튼 활성화
        selfView.summonerNameInputTextField.rx.text.subscribe(
            onNext: { text in
            
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
