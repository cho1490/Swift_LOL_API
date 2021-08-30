//
//  ChampionMasteryExtension.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/14.
//

import UIKit

extension ChampionMasteryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        view.addSubview(selfView.infoView)
        selfView.infoView.translatesAutoresizingMaskIntoConstraints = false
        selfView.infoView.centerYAnchor.constraint(equalTo: collectionView.centerYAnchor).isActive = true
        selfView.infoView.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor).isActive = true
        selfView.infoView.heightAnchor.constraint(equalToConstant: 410).isActive = true
        selfView.infoView.widthAnchor.constraint(equalToConstant: view.frame.width - 80).isActive = true
        selfView.infoView.configureUI(championMastery: viewModel.currentChampionMasteryList[indexPath.row])
        
        UIView.animate(withDuration: 0.2) { [unowned self] in
            selfView.infoView.alpha = 1
            selfView.blurEffectView.alpha = 1
            selfView.infoView.transform = .identity
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 48) / 4 // 가로 4줄
        return CGSize(width: width, height: width / 4 * 5) 
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 9, left: 9, bottom: 9, right: 9)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.currentChampionMasteryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChampionMasteryCell.identifier, for: indexPath) as! ChampionMasteryCell
        
        cell.configureUI(championMastery: viewModel.currentChampionMasteryList[indexPath.row])
        cell.layoutMargins.bottom = 20
        cell.layer.cornerRadius = 6
        cell.layer.masksToBounds = true
        cell.backgroundColor = Constant.Color.MY_BACKGROUND
        return cell
    }
    
}
