//
//  RankingExtension.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/28.
//

import UIKit

extension RankingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.getSummoner(summonerName: viewModel.currentRankers[indexPath.row].summonerName!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.currentRankers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RankingCell.identifier, for: indexPath) as! RankingCell
        let ranker = viewModel.currentRankers[indexPath.row]
        cell.configureUI(index: indexPath.row, ranker: ranker)
        cell.selectionStyle = .none
        return cell
    }
    
}


