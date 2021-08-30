//
//  SimpleViewCell.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/18.
//

import UIKit
import Then
import SDWebImage

class SimpleCell: UICollectionViewCell {
    
    static let identifier = "SimpleCellIdentifier"
    
    let nameLabel = UILabel().then {
        $0.font = $0.font.withSize(11)
    }
    
    let championImage = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.widthAnchor.constraint(equalToConstant: 35).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 35).isActive = true
        $0.layer.cornerRadius = 17.5
        $0.clipsToBounds = true
    }
    
    let levelView = UIView().then {
        $0.backgroundColor = Constant.Color.MY_BACKGROUND
    }
    
    let levelLabel = UILabel().then {
        $0.font = $0.font.withSize(8)
        $0.textColor = .black
    }
    
    let kdaLabel = UILabel().then {
        $0.font = $0.font.withSize(11)
    }
    
    let spell1Image = UIImageView().then {
        $0.layer.cornerRadius = 4
        $0.contentMode = .scaleAspectFill
        $0.widthAnchor.constraint(equalToConstant: 16).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 16).isActive = true
    }

    let spell2Image = UIImageView().then {
        $0.layer.cornerRadius = 4
        $0.contentMode = .scaleAspectFill
        $0.widthAnchor.constraint(equalToConstant: 16).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 16).isActive = true
    }

    let rune1Image = UIImageView().then {
        $0.layer.cornerRadius = 9.5
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.widthAnchor.constraint(equalToConstant: 16).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 16).isActive = true
        $0.backgroundColor = .black
    }

    let rune2Image = UIImageView().then {
        $0.layer.cornerRadius = 9.5
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.widthAnchor.constraint(equalToConstant: 16).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 16).isActive = true
        $0.backgroundColor = .gray
    }
    
    let item0Image = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.widthAnchor.constraint(equalToConstant: 20).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 20).isActive = true
        $0.backgroundColor = .systemGray
    }

    let item1Image = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.widthAnchor.constraint(equalToConstant: 20).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 20).isActive = true
        $0.backgroundColor = .systemGray
    }

    let item2Image = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.widthAnchor.constraint(equalToConstant: 20).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 20).isActive = true
        $0.backgroundColor = .systemGray
    }

    let item3Image = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.widthAnchor.constraint(equalToConstant: 20).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 20).isActive = true
        $0.backgroundColor = .systemGray
    }

    let item4Image = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.widthAnchor.constraint(equalToConstant: 20).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 20).isActive = true
        $0.backgroundColor = .systemGray
    }

    let item5Image = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.widthAnchor.constraint(equalToConstant: 20).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 20).isActive = true
        $0.backgroundColor = .systemGray
    }

    let item6Image = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.widthAnchor.constraint(equalToConstant: 20).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 20).isActive = true
        $0.backgroundColor = .systemGray
    }
    
    lazy var spellStackView = UIStackView(arrangedSubviews: [spell1Image, spell2Image]).then {
        $0.axis = .vertical
        $0.spacing = 3
    }

    lazy var runeStackView = UIStackView(arrangedSubviews: [rune1Image, rune2Image]).then {
        $0.axis = .vertical
        $0.spacing = 3
    }
    
    lazy var itemStackView = UIStackView(arrangedSubviews: [item0Image, item1Image, item2Image, item3Image, item4Image, item5Image, item6Image]).then {
        $0.spacing = 4
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI(participant: Participant, summonerName: String) {
        addSubview(championImage)
        championImage.translatesAutoresizingMaskIntoConstraints = false
        championImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        championImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 6).isActive = true
        
        addSubview(levelView)
        levelView.translatesAutoresizingMaskIntoConstraints = false
        levelView.centerYAnchor.constraint(equalTo: championImage.bottomAnchor).isActive = true
        levelView.centerXAnchor.constraint(equalTo: championImage.centerXAnchor).isActive = true
        levelView.widthAnchor.constraint(equalToConstant: 17).isActive = true
        levelView.heightAnchor.constraint(equalToConstant: 11).isActive = true
        levelView.layer.cornerRadius = 6
        
        addSubview(levelLabel)
        levelLabel.translatesAutoresizingMaskIntoConstraints = false
        levelLabel.centerYAnchor.constraint(equalTo: levelView.centerYAnchor).isActive = true
        levelLabel.centerXAnchor.constraint(equalTo: levelView.centerXAnchor).isActive = true
        
        addSubview(spellStackView)
        spellStackView.translatesAutoresizingMaskIntoConstraints = false
        spellStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        spellStackView.leftAnchor.constraint(equalTo: championImage.rightAnchor, constant: 4).isActive = true
        
        addSubview(runeStackView)
        runeStackView.translatesAutoresizingMaskIntoConstraints = false
        runeStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        runeStackView.leftAnchor.constraint(equalTo: spellStackView.rightAnchor, constant: 4).isActive = true
        
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerYAnchor.constraint(equalTo: rune1Image.centerYAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: runeStackView.rightAnchor, constant: 4).isActive = true
        
        addSubview(kdaLabel)
        kdaLabel.translatesAutoresizingMaskIntoConstraints = false
        kdaLabel.centerYAnchor.constraint(equalTo: rune2Image.centerYAnchor).isActive = true
        kdaLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        
        addSubview(itemStackView)
        itemStackView.translatesAutoresizingMaskIntoConstraints = false
        itemStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        itemStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -6).isActive = true
        
        settingCell(participant: participant, summonerName: summonerName)
    }
    
    private func settingCell(participant: Participant, summonerName: String) {
        //let participantIndex = getParticipantIndex(summoner: summoner, matchInfo: matchInfo)
       
        nameLabel.text = summonerName
      
        if let url = URL(string: DATA_DRAGON.getChampion.getURL(subString: Converter.getChampionName(championID: participant.championId!))) {
            self.championImage.sd_setImage(with: url, completed: nil)
        }
        
        levelLabel.text = "\(participant.stats?.champLevel ?? 0)"
        
        if let url = URL(string: DATA_DRAGON.getSpell.getURL(subString: Converter.getSummonerSpellName(summonerSpellID: participant.spell1Id!))) {
            self.spell1Image.sd_setImage(with: url, completed: nil)
        }
        
        if let url = URL(string: DATA_DRAGON.getSpell.getURL(subString: Converter.getSummonerSpellName(summonerSpellID: participant.spell2Id!))) {
            self.spell2Image.sd_setImage(with: url, completed: nil)
        }
        
        if let url = URL(string: DATA_DRAGON.getRune.getURL(subString: Converter.getRuneRoute(runeID: (participant.stats?.perk0)!))) {
            self.rune1Image.sd_setImage(with: url, completed: nil)
        }
        
        if let url = URL(string: DATA_DRAGON.getRune.getURL(subString: Converter.getRuneRoute(runeID: (participant.stats?.perkSubStyle)!))) {
            self.rune2Image.sd_setImage(with: url, completed: nil)
        }
        
        let k = participant.stats?.kills
        let d = participant.stats?.deaths
        let a = participant.stats?.assists
        
        kdaLabel.text = "\(k!) | \(d!) | \(a!)"
        
        if let url = URL(string: DATA_DRAGON.getItem.getURL(subString: String((participant.stats?.item0)!))) {
            item0Image.sd_setImage(with: url, completed: nil)
        }
        
        if let url = URL(string: DATA_DRAGON.getItem.getURL(subString: String((participant.stats?.item1)!))) {
            item1Image.sd_setImage(with: url, completed: nil)
        }
        
        if let url = URL(string: DATA_DRAGON.getItem.getURL(subString: String((participant.stats?.item2)!))) {
            item2Image.sd_setImage(with: url, completed: nil)
        }
        
        if let url = URL(string: DATA_DRAGON.getItem.getURL(subString: String((participant.stats?.item3)!))) {
            item3Image.sd_setImage(with: url, completed: nil)
        }
        
        if let url = URL(string: DATA_DRAGON.getItem.getURL(subString: String((participant.stats?.item4)!))) {
            item4Image.sd_setImage(with: url, completed: nil)
        }
        
        if let url = URL(string: DATA_DRAGON.getItem.getURL(subString: String((participant.stats?.item5)!))) {
            item5Image.sd_setImage(with: url, completed: nil)
        }
        
        if let url = URL(string: DATA_DRAGON.getItem.getURL(subString: String((participant.stats?.item6)!))) {
            item6Image.sd_setImage(with: url, completed: nil)
        }
    }
    
   /*
    private func getParticipantIndex(summoner: Summoner, matchInfo: MatchInfo) -> Int {
        for identities in matchInfo.participantIdentities {
            if identities.player?.accountId == summoner.accountId {
                    return identities.participantId!-1
            }
        }
        return -1
    }
    */
}
