//
//  GraphExtension.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/21.
//

import UIKit

extension GraphViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teamList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - (view.frame.width / 17 * 2)) / 6
        return CGSize(width: width, height: width)
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GraphCell.identifier, for: indexPath) as! GraphCell
        cell.configureUI(championID: teamList[indexPath.row].championId!)
        cell.layer.cornerRadius = 6
        cell.layer.masksToBounds = true
        return cell
    }
    
}
