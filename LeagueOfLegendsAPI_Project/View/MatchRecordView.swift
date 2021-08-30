//
//  MatchRecordView.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/10.
//

import UIKit
import Then

class MatchRecordView: BaseView {
    
    let summonerInfoView = SummonerInfoView()
    
    let collectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = .systemBackground
        
        return cv
    }()
    
    override func configureUI() {
        addSubview(summonerInfoView)
        summonerInfoView.translatesAutoresizingMaskIntoConstraints = false
        summonerInfoView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor).isActive = true
        summonerInfoView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        summonerInfoView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        summonerInfoView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: summonerInfoView.bottomAnchor, constant: 10).isActive = true
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
}
