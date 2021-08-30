//
//  MatchRecordViewController.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/10.
//

import UIKit

extension MatchRecordViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let getMatchInfoViewModel = viewModel.currentMatchList[indexPath.row]
        coordinator?.matchRecordCellTapped(viewModel: getMatchInfoViewModel, summoner: summoner)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.currentMatchList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MatchRecordCell.identifier, for: indexPath) as! MatchRecordCell
        
        let matchRecordCellViewModel = viewModel.currentMatchList[indexPath.row]
        
        cell.configureUI(viewModel: matchRecordCellViewModel, summoner: summoner)
        cell.layer.cornerRadius = 6
        cell.layer.masksToBounds = true
        cell.backgroundColor = Constant.Color.MY_BACKGROUND
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 17 * 16, height: 90)
    }
    
}
