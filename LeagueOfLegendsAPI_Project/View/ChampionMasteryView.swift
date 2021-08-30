//
//  ChampionMasteryView.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/10.
//

import UIKit
import Then

class ChampionMasteryView: BaseView {
 
    let collectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = .systemBackground
        
        return cv
    }()
    
    
    let blurEffectView = UIVisualEffectView().then {
        $0.effect = UIBlurEffect(style: UIBlurEffect.Style.dark)
    }
    
    let infoView = ChampionMasteryInfoVIew()
    
    override func configureUI() {
        backgroundColor = .systemBackground
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        collectionView.addSubview(blurEffectView)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        blurEffectView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        blurEffectView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        blurEffectView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        blurEffectView.alpha = 0
        
        let blurEffectViewTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(blurEffectViewTapped))
        blurEffectView.addGestureRecognizer(blurEffectViewTapGestureRecognizer)
        
        addSubview(loadingView)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        loadingView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        loadingView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        loadingView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    @objc func blurEffectViewTapped() {
        removeInfoViewAnimation()
    }
    
    func removeInfoViewAnimation() {
        UIView.animate(withDuration: 0.3, animations: { [unowned self] in
            blurEffectView.alpha = 0
            infoView.alpha = 0
            infoView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }) { [unowned self] _ in
            infoView.removeFromSuperview()
        }
    }
    
}
