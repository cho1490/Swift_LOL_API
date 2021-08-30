//
//  MatchInfoDetailTabmanView.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/17.
//

import Foundation

class MatchInfoDetailTabmanView: BaseView {
    
    override func configureUI() {
        addSubview(loadingView)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        loadingView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        loadingView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        loadingView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
