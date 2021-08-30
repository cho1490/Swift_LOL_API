//
//  SimpleExtension.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/18.
//

import UIKit

extension SimpleViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var count = 0
        
        if selfView.myTeamCollectionView == collectionView {
            count = myTeamList.count
        } else if selfView.enemyTeamCollectionView == collectionView {
            count = enemyTeamList.count
        } else if selfView.myTeamInfoView.banCollectionView == collectionView {
            count = myTeam.bans!.count
        } else if selfView.enemyTeamInfoView.banCollectionView == collectionView {
            count = enemyTeam.bans!.count
        }
    
        return count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if selfView.myTeamCollectionView == collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SimpleCell.identifier, for: indexPath) as! SimpleCell
            cell.configureUI(participant: myTeamList[indexPath.row], summonerName: myTeamNameList[indexPath.row])
            cell.transform = CGAffineTransform(scaleX: 1, y: -1)
            cell.layer.cornerRadius = 6
            cell.layer.masksToBounds = true
            cell.backgroundColor = Constant.Color.MY_GREY
            return cell
        } else if selfView.enemyTeamCollectionView == collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SimpleCell.identifier, for: indexPath) as! SimpleCell
            cell.configureUI(participant: enemyTeamList[indexPath.row], summonerName: enemyTeamNameList[indexPath.row])
            cell.layer.cornerRadius = 6
            cell.layer.masksToBounds = true
            cell.backgroundColor = Constant.Color.MY_GREY
            return cell
        } else if selfView.myTeamInfoView.banCollectionView == collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BanCell.identifier, for: indexPath) as! BanCell
            cell.configureUI(championID: myTeam.bans?[indexPath.row].championId! ?? -1)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BanCell.identifier, for: indexPath) as! BanCell
            cell.configureUI(championID: enemyTeam.bans?[indexPath.row].championId! ?? -1)
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if selfView.myTeamCollectionView == collectionView || selfView.enemyTeamCollectionView == collectionView {
            return CGSize(width: view.frame.width / 17 * 16, height: 50)
        } else {
            let width = ((view.frame.width / 2) - 45) / 6
            return CGSize(width: width, height: width)
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 1
    }
       
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if selfView.myTeamCollectionView == collectionView || selfView.enemyTeamCollectionView == collectionView {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        } else if selfView.myTeamInfoView.banCollectionView == collectionView {
            let totalCellWidth = (((Int(view.frame.width) - 70) / 2) / 6) * myTeam.bans!.count
            let totalSpacingWidth = 1 * (myTeam.bans!.count - 1)
            let leftInset = (((view.frame.width - 70) / 2) - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
            let rightInset = leftInset
            return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
        } else {
            let totalCellWidth = (((Int(view.frame.width) - 70) / 2) / 6) * enemyTeam.bans!.count
            let totalSpacingWidth = 1 * (enemyTeam.bans!.count - 1)
            let leftInset = (((view.frame.width - 70) / 2) - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
            let rightInset = leftInset
            return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
        }
    
    }
    
}

