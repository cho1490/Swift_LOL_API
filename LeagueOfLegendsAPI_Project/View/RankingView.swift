//
//  RankingView.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/27.
//

import UIKit
import Then

class RankingView: BaseView {
    
    let tableView: UITableView = {
        let view = UITableView()
        return view
    }()
    
    override func configureUI() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.register(RankingCell.self, forCellReuseIdentifier: RankingCell.identifier)
        tableView.separatorStyle = .none
        
        addSubview(loadingView)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        loadingView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        loadingView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        loadingView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
}
