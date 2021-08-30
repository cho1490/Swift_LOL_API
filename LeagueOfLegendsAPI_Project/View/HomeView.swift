//
//  HomeView.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/02.
//

import UIKit
import Then

class HomeView: BaseView {
    
    let imageView = UIImageView().then {
        $0.image = UIImage(named: "LTU")
        $0.widthAnchor.constraint(equalToConstant: 80).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    let summonerNameInputTextField = UITextField().then {
        $0.borderStyle = .roundedRect
        $0.placeholder = "소환사 닉네임을 입력해주세요."
        $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        $0.widthAnchor.constraint(equalToConstant: 250).isActive = true
    }
    
    let searchButton = UIButton().then {
        $0.backgroundColor = Constant.Color.MY_BLUE
        $0.setTitle("검색", for: .normal)
        $0.layer.cornerRadius = 6
        $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        $0.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    override func configureUI() {
        addSubview(summonerNameInputTextField)
        summonerNameInputTextField.translatesAutoresizingMaskIntoConstraints = false
        summonerNameInputTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        summonerNameInputTextField.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.bottomAnchor.constraint(equalTo: summonerNameInputTextField.topAnchor, constant: -80).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(searchButton)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.topAnchor.constraint(equalTo: summonerNameInputTextField.bottomAnchor, constant: 30).isActive = true
        searchButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
}
