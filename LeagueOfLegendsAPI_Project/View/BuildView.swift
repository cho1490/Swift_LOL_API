//
//  TotalView.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/17.
//

import UIKit
import Then

class BuildView: BaseView {
     
    let runeLabel = UILabel().then {
        $0.font = $0.font.withSize(17)
        $0.text = "룬"
    }
    
    let championImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.widthAnchor.constraint(equalToConstant: 70).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 70).isActive = true
        $0.layer.cornerRadius = 35
        $0.clipsToBounds = true
    }
    
    let mainRuneImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.widthAnchor.constraint(equalToConstant: 35).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 35).isActive = true
        $0.layer.cornerRadius = 17.5
        $0.clipsToBounds = true
        $0.backgroundColor = .black
    }
    
    let secondaryRuneStyleImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.widthAnchor.constraint(equalToConstant: 28).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 28).isActive = true
        $0.layer.cornerRadius = 14
        $0.clipsToBounds = true
        $0.backgroundColor = .black
    }
    
    let horizontalLine = UIView().then {
        $0.backgroundColor = .tertiarySystemGroupedBackground
        $0.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    let mainRune1ImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.widthAnchor.constraint(equalToConstant: 35).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 35).isActive = true
        $0.layer.cornerRadius = 17.5
        $0.clipsToBounds = true
    }
    
    let mainRune2ImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.widthAnchor.constraint(equalToConstant: 35).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 35).isActive = true
        $0.layer.cornerRadius = 17.5
        $0.clipsToBounds = true
    }
    
    let mainRune3ImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.widthAnchor.constraint(equalToConstant: 35).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 35).isActive = true
        $0.layer.cornerRadius = 17.5
        $0.clipsToBounds = true
    }

    let verticalLine1 = UIView().then {
        $0.backgroundColor = .tertiarySystemGroupedBackground
        $0.widthAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    let secondaryRune1ImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.widthAnchor.constraint(equalToConstant: 35).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 35).isActive = true
        $0.layer.cornerRadius = 17.5
        $0.clipsToBounds = true
    }
    
    let secondaryRune2ImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.widthAnchor.constraint(equalToConstant: 35).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 35).isActive = true
        $0.layer.cornerRadius = 17.5
        $0.clipsToBounds = true
    }
    
    let verticalLine2 = UIView().then {
        $0.backgroundColor = .tertiarySystemGroupedBackground
        $0.widthAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    let runeFragment1ImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.widthAnchor.constraint(equalToConstant: 35).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 35).isActive = true
        $0.layer.cornerRadius = 17.5
        $0.clipsToBounds = true
        $0.backgroundColor = .black
    }
    
    let runeFragment2ImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.widthAnchor.constraint(equalToConstant: 35).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 35).isActive = true
        $0.layer.cornerRadius = 17.5
        $0.clipsToBounds = true
        $0.backgroundColor = .black
    }
    
    let runeFragment3ImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.widthAnchor.constraint(equalToConstant: 35).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 35).isActive = true
        $0.layer.cornerRadius = 17.5
        $0.clipsToBounds = true
        $0.backgroundColor = .black
    }
    
    lazy var mainRuneStackView = UIStackView(arrangedSubviews: [mainRune1ImageView,  mainRune2ImageView, mainRune3ImageView]).then {
        $0.axis = .vertical
        $0.spacing = 15
    }
    
    lazy var secondaryRuneStackView = UIStackView(arrangedSubviews: [secondaryRune1ImageView, secondaryRune2ImageView]).then {
        $0.axis = .vertical
        $0.spacing = 15
    }
    
    lazy var runeFragmentStackView = UIStackView(arrangedSubviews: [runeFragment1ImageView, runeFragment2ImageView, runeFragment3ImageView]).then {
        $0.axis = .vertical
        $0.spacing = 15
    }
    
    let skillLabel = UILabel().then {
        $0.font = $0.font.withSize(17)
        $0.text = "스킬"
    }
    
    let collectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = .systemBackground
        
        return cv
    }()

    override func configureUI() {
        addSubview(runeLabel)
        runeLabel.translatesAutoresizingMaskIntoConstraints = false
        runeLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        runeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(championImageView)
        championImageView.translatesAutoresizingMaskIntoConstraints = false
        championImageView.topAnchor.constraint(equalTo: runeLabel.bottomAnchor, constant: 20).isActive = true
        championImageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -40).isActive = true
        
        addSubview(mainRuneImageView)
        mainRuneImageView.translatesAutoresizingMaskIntoConstraints = false
        mainRuneImageView.leftAnchor.constraint(equalTo: championImageView.rightAnchor, constant: 6).isActive = true
        mainRuneImageView.bottomAnchor.constraint(equalTo: championImageView.bottomAnchor).isActive = true
        
        addSubview(secondaryRuneStyleImageView)
        secondaryRuneStyleImageView.translatesAutoresizingMaskIntoConstraints = false
        secondaryRuneStyleImageView.leftAnchor.constraint(equalTo: mainRuneImageView.rightAnchor, constant: 3).isActive = true
        secondaryRuneStyleImageView.bottomAnchor.constraint(equalTo: mainRuneImageView.bottomAnchor).isActive = true

        addSubview(horizontalLine)
        horizontalLine.translatesAutoresizingMaskIntoConstraints = false
        horizontalLine.topAnchor.constraint(equalTo: championImageView.bottomAnchor, constant: 10).isActive = true
        horizontalLine.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        horizontalLine.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        
        addSubview(mainRuneStackView)
        mainRuneStackView.translatesAutoresizingMaskIntoConstraints = false
        mainRuneStackView.topAnchor.constraint(equalTo: horizontalLine.bottomAnchor, constant: 10).isActive = true
        
        addSubview(verticalLine1)
        verticalLine1.translatesAutoresizingMaskIntoConstraints = false
        verticalLine1.topAnchor.constraint(equalTo: horizontalLine.bottomAnchor, constant: 20).isActive = true
        
        addSubview(secondaryRuneStackView)
        secondaryRuneStackView.translatesAutoresizingMaskIntoConstraints = false
        secondaryRuneStackView.topAnchor.constraint(equalTo: horizontalLine.bottomAnchor, constant: 10).isActive = true
        
        addSubview(verticalLine2)
        verticalLine2.translatesAutoresizingMaskIntoConstraints = false
        verticalLine2.topAnchor.constraint(equalTo: horizontalLine.bottomAnchor, constant: 20).isActive = true
        
        addSubview(runeFragmentStackView)
        runeFragmentStackView.translatesAutoresizingMaskIntoConstraints = false
        runeFragmentStackView.topAnchor.constraint(equalTo: horizontalLine.bottomAnchor, constant: 10).isActive = true
        
        
        secondaryRuneStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        verticalLine1.rightAnchor.constraint(equalTo: secondaryRuneStackView.leftAnchor, constant: -40).isActive = true

        mainRuneStackView.rightAnchor.constraint(equalTo: verticalLine1.leftAnchor, constant: -40).isActive = true
        
        verticalLine2.leftAnchor.constraint(equalTo: secondaryRuneStackView.rightAnchor, constant: 40).isActive = true
        
        runeFragmentStackView.leftAnchor.constraint(equalTo: verticalLine2.rightAnchor, constant: 40).isActive = true
        
        verticalLine1.bottomAnchor.constraint(equalTo: mainRuneStackView.bottomAnchor, constant: -10).isActive = true
        verticalLine2.bottomAnchor.constraint(equalTo: mainRuneStackView.bottomAnchor, constant: -10).isActive = true
        
        addSubview(skillLabel)
        skillLabel.translatesAutoresizingMaskIntoConstraints = false
        skillLabel.topAnchor.constraint(equalTo: verticalLine1.bottomAnchor, constant: 40).isActive = true
        skillLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: skillLabel.bottomAnchor, constant: 20).isActive = true
        collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(loadingView)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        loadingView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        loadingView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        loadingView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func settingView(participant: Participant) {
        if let url = URL(string: DATA_DRAGON.getChampion.getURL(subString: Converter.getChampionName(championID: participant.championId!))) {
            championImageView.sd_setImage(with: url, completed: nil)
        }
        
        if let url = URL(string: DATA_DRAGON.getRune.getURL(subString: Converter.getRuneRoute(runeID: (participant.stats?.perk0)!))) {
            mainRuneImageView.sd_setImage(with: url, completed: nil)
        }
        
        if let url = URL(string: DATA_DRAGON.getRune.getURL(subString: Converter.getRuneRoute(runeID: (participant.stats?.perkSubStyle)!))) {
            secondaryRuneStyleImageView.sd_setImage(with: url, completed: nil)
        }
        
        if let url = URL(string: DATA_DRAGON.getRune.getURL(subString: Converter.getRuneRoute(runeID: (participant.stats?.perk1)!))) {
            mainRune1ImageView.sd_setImage(with: url, completed: nil)
        }
        
        if let url = URL(string: DATA_DRAGON.getRune.getURL(subString: Converter.getRuneRoute(runeID: (participant.stats?.perk2)!))) {
            mainRune2ImageView.sd_setImage(with: url, completed: nil)
        }
        
        if let url = URL(string: DATA_DRAGON.getRune.getURL(subString: Converter.getRuneRoute(runeID: (participant.stats?.perk3)!))) {
            mainRune3ImageView.sd_setImage(with: url, completed: nil)
        }
        
        if let url = URL(string: DATA_DRAGON.getRune.getURL(subString: Converter.getRuneRoute(runeID: (participant.stats?.perk4)!))) {
            secondaryRune1ImageView.sd_setImage(with: url, completed: nil)
        }
        
        if let url = URL(string: DATA_DRAGON.getRune.getURL(subString: Converter.getRuneRoute(runeID: (participant.stats?.perk5)!))) {
            secondaryRune2ImageView.sd_setImage(with: url, completed: nil)
        }
        
        if let url = URL(string: DATA_DRAGON.getRuneFragment.getURL(subString: Converter.getRuneRoute(runeID: (participant.stats?.statPerk0)!))) {
            runeFragment1ImageView.sd_setImage(with: url, completed: nil)
        }
        
        if let url = URL(string: DATA_DRAGON.getRuneFragment.getURL(subString: Converter.getRuneRoute(runeID: (participant.stats?.statPerk1)!))) {
            runeFragment2ImageView.sd_setImage(with: url, completed: nil)
        }
        
        if let url = URL(string: DATA_DRAGON.getRuneFragment.getURL(subString: Converter.getRuneRoute(runeID: (participant.stats?.statPerk2)!))) {
            runeFragment3ImageView.sd_setImage(with: url, completed: nil)
        }
    }

}
