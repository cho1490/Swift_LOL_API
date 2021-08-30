//
//  MatchRecordCell.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/10.
//

import UIKit
import Then
import SDWebImage

class MatchRecordCell: UICollectionViewCell {
    
    static let identifier = "MatchRecordCellIdentifier"

    let resultLabel = UILabel().then {
        $0.textAlignment = .center
        $0.textColor = .white
    }

    let line = UIView().then {
        $0.heightAnchor.constraint(equalToConstant: 1).isActive = true
        $0.backgroundColor = .white
    }

    let gameTimeLabel = UILabel().then {
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = $0.font.withSize(12)
    }

    // MARK: ChamepionImage
    let championImage = UIImageView().then {
        $0.layer.cornerRadius = 17.5
        $0.contentMode = .scaleAspectFill
        $0.widthAnchor.constraint(equalToConstant: 40).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    // MARK: spellStackView
    let spell1Image = UIImageView().then {
        $0.layer.cornerRadius = 4
        $0.contentMode = .scaleAspectFill
        $0.widthAnchor.constraint(equalToConstant: 19).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 19).isActive = true
    }

    let spell2Image = UIImageView().then {
        $0.layer.cornerRadius = 4
        $0.contentMode = .scaleAspectFill
        $0.widthAnchor.constraint(equalToConstant: 19).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 19).isActive = true
    }

    // MARK: runeStackView
    let rune1Image = UIImageView().then {
        $0.layer.cornerRadius = 9.5
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.widthAnchor.constraint(equalToConstant: 19).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 19).isActive = true
        $0.backgroundColor = .black
    }

    let rune2Image = UIImageView().then {
        $0.layer.cornerRadius = 9.5
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.widthAnchor.constraint(equalToConstant: 19).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 19).isActive = true
        $0.backgroundColor = .gray
    }

    // MARK: kInfoStackView
    let kdaLabel = UILabel().then {
        $0.font = $0.font.withSize(14)
    }
    
    let kdaScoreLabel = UILabel().then {
        $0.font = $0.font.withSize(11)
    }

    // MARK: itemStackView
    let item0Image = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.widthAnchor.constraint(equalToConstant: 23).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 23).isActive = true
        $0.backgroundColor = .systemGray
    }

    let item1Image = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.widthAnchor.constraint(equalToConstant: 23).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 23).isActive = true
        $0.backgroundColor = .systemGray
    }

    let item2Image = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.widthAnchor.constraint(equalToConstant: 23).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 23).isActive = true
        $0.backgroundColor = .systemGray
    }

    let item3Image = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.widthAnchor.constraint(equalToConstant: 23).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 23).isActive = true
        $0.backgroundColor = .systemGray
    }

    let item4Image = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.widthAnchor.constraint(equalToConstant: 23).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 23).isActive = true
        $0.backgroundColor = .systemGray
    }

    let item5Image = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.widthAnchor.constraint(equalToConstant: 23).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 23).isActive = true
        $0.backgroundColor = .systemGray
    }

    let item6Image = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.widthAnchor.constraint(equalToConstant: 23).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 23).isActive = true
        $0.backgroundColor = .systemGray
    }

    // MARK: dataStackView
    let queueLabel = UILabel().then {
        $0.textAlignment = .right
        $0.font = $0.font.withSize(13)
        
    }

    let timeStampLabel = UILabel().then {
        $0.font = $0.font.withSize(12)
    }

    // MARK: ALL StackView
    lazy var resultStackView = UIStackView(arrangedSubviews: [resultLabel, line, gameTimeLabel]).then {
        $0.axis = .vertical
    }

    lazy var spellStackView = UIStackView(arrangedSubviews: [spell1Image, spell2Image]).then {
        $0.axis = .vertical
        $0.spacing = 3
    }

    lazy var runeStackView = UIStackView(arrangedSubviews: [rune1Image, rune2Image]).then {
        $0.axis = .vertical
        $0.spacing = 3
    }

    lazy var kInfoStackView = UIStackView(arrangedSubviews: [kdaLabel, kdaScoreLabel]).then {
        $0.axis = .vertical
        $0.spacing = 3
        $0.alignment = .center
    }

    lazy var championStackView = UIStackView(arrangedSubviews: [championImage, spellStackView, runeStackView]).then {
        $0.spacing = 3
        $0.alignment = .center
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
    
    func configureUI(viewModel: GetMatchInfoViewModel, summoner: Summoner) {
        addSubview(resultStackView)
        resultStackView.translatesAutoresizingMaskIntoConstraints = false
        resultStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        resultStackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        resultStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        resultStackView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        
        addSubview(championStackView)
        championStackView.translatesAutoresizingMaskIntoConstraints = false
        championStackView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        championStackView.leftAnchor.constraint(equalTo: resultStackView.rightAnchor, constant: 8).isActive = true
        
        addSubview(itemStackView)
        itemStackView.translatesAutoresizingMaskIntoConstraints = false
        itemStackView.leftAnchor.constraint(equalTo: championStackView.leftAnchor).isActive = true
        itemStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        
        addSubview(kInfoStackView)
        kInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        kInfoStackView.topAnchor.constraint(equalTo: championStackView.topAnchor).isActive = true
        kInfoStackView.leftAnchor.constraint(equalTo: championStackView.rightAnchor).isActive = true
        kInfoStackView.rightAnchor.constraint(equalTo: itemStackView.rightAnchor).isActive = true
        
        addSubview(queueLabel)
        queueLabel.translatesAutoresizingMaskIntoConstraints = false
        queueLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        queueLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -5).isActive = true
        
        addSubview(timeStampLabel)
        timeStampLabel.translatesAutoresizingMaskIntoConstraints = false
        timeStampLabel.topAnchor.constraint(equalTo: queueLabel.bottomAnchor, constant: 3).isActive = true
        timeStampLabel.rightAnchor.constraint(equalTo: queueLabel.rightAnchor).isActive =
            true

        
        viewModel.matchInfo.subscribe(
            onNext: { matchInfo in
                let participantIndex = self.getParticipantIndex(matchInfo: matchInfo, summoner: summoner)
                self.settingCell(matchInfo: matchInfo, participant: matchInfo.participants[participantIndex])
            }
        ).disposed(by: viewModel.disposeBag)
        
        viewModel.getMatchInfo(matchID: viewModel.match.gameId!)
    }
    
    private func getParticipantIndex(matchInfo: MatchInfo, summoner: Summoner) -> Int {
        for identities in matchInfo.participantIdentities {
            if identities.player?.accountId == summoner.accountId {
                    return identities.participantId!-1
            }
        }
        return -1
    }
    
    private func settingCell(matchInfo: MatchInfo, participant: Participant) {
        var teamIndex: Int
        if matchInfo.teams[0].teamId == participant.teamId {
            teamIndex = 0
        } else {
            teamIndex = 1
        }
        
        switch matchInfo.teams[teamIndex].win {
        case "Win":
            resultLabel.text = "승"
            resultStackView.backgroundColor = Constant.Color.MY_BLUE
        case "Fail":
            resultLabel.text = "패"
            resultStackView.backgroundColor = Constant.Color.MY_RED
        default:
            resultLabel.text = "리"
            resultStackView.backgroundColor = Constant.Color.MY_GREY
        }
        
        gameTimeLabel.text = "\(String(Int(round(matchInfo.gameDuration / 60))))분"
        
        if let url = URL(string: DATA_DRAGON.getChampion.getURL(subString: Converter.getChampionName(championID: participant.championId!))) {
            self.championImage.sd_setImage(with: url, completed: nil)
        }
        
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
        
        let k = participant.stats!.kills!
        let d = participant.stats!.deaths!
        let a = participant.stats!.assists!
        
        kdaLabel.text = "\(k) | \(d) | \(a)"
        if d == 0 {
            kdaScoreLabel.text = "Perfect!"
        } else {
            kdaScoreLabel.text = "kda : \(String(format: "%.1f", Double(k + a) / Double(d)))"
        }
        
        if let url = URL(string: DATA_DRAGON.getItem.getURL(subString: String(participant.stats!.item0!))) {
            item0Image.sd_setImage(with: url, completed: nil)
        }
        
        if let url = URL(string: DATA_DRAGON.getItem.getURL(subString: String(participant.stats!.item1!))) {
            item1Image.sd_setImage(with: url, completed: nil)
        }
        
        if let url = URL(string: DATA_DRAGON.getItem.getURL(subString: String(participant.stats!.item2!))) {
            item2Image.sd_setImage(with: url, completed: nil)
        }
        
        if let url = URL(string: DATA_DRAGON.getItem.getURL(subString: String(participant.stats!.item3!))) {
            item3Image.sd_setImage(with: url, completed: nil)
        }
        
        if let url = URL(string: DATA_DRAGON.getItem.getURL(subString: String(participant.stats!.item4!))) {
            item4Image.sd_setImage(with: url, completed: nil)
        }
        
        if let url = URL(string: DATA_DRAGON.getItem.getURL(subString: String(participant.stats!.item5!))) {
            item5Image.sd_setImage(with: url, completed: nil)
        }
        
        if let url = URL(string: DATA_DRAGON.getItem.getURL(subString: String(participant.stats!.item6!))) {
            item6Image.sd_setImage(with: url, completed: nil)
        }
        
        queueLabel.text = Converter.getGmaeMode(queueID: matchInfo.queueId)
        timeStampLabel.text = Converter.getTimePassed(timeStamp: matchInfo.gameCreation)
    }

    override func prepareForReuse() {
        championImage.sd_cancelCurrentImageLoad()
        championImage.image = nil

        spell1Image.sd_cancelCurrentImageLoad()
        spell1Image.image = nil
        
        spell2Image.sd_cancelCurrentImageLoad()
        spell2Image.image = nil
        
        rune1Image.sd_cancelCurrentImageLoad()
        rune1Image.image = nil
        
        rune2Image.sd_cancelCurrentImageLoad()
        rune2Image.image = nil
        
        item0Image.sd_cancelCurrentImageLoad()
        item0Image.image = nil
        
        item1Image.sd_cancelCurrentImageLoad()
        item1Image.image = nil
        
        item2Image.sd_cancelCurrentImageLoad()
        item2Image.image = nil
        
        item3Image.sd_cancelCurrentImageLoad()
        item3Image.image = nil
        
        item4Image.sd_cancelCurrentImageLoad()
        item4Image.image = nil
        
        item5Image.sd_cancelCurrentImageLoad()
        item5Image.image = nil
        
        item6Image.sd_cancelCurrentImageLoad()
        item6Image.image = nil
    }
    
}
