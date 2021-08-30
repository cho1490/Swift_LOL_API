//
//  DamageViewController.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/08/17.
//

import UIKit
import RxCocoa
import Charts

class GraphViewController: BaseViewController {
    
    var summoner: Summoner
    var matchInfo: MatchInfo
    var teamList: [Participant]
    
    let selfView = GraphView()
    let segmentView = UISegmentedControl(items: ["딜량", "시야점수", "미니언", "골드"])
    
    init(summoner: Summoner, matchInfo: MatchInfo) {
        self.summoner = summoner
        self.matchInfo = matchInfo
        
        var participantIndex = 0
        for identities in matchInfo.participantIdentities {
            if identities.player?.accountId == summoner.accountId {
                participantIndex = identities.participantId!-1
            }
        }
        
        let teamId = matchInfo.participants[participantIndex].teamId
        var currentTeamList: [Participant] = []
        for participant in matchInfo.participants {
            if teamId == participant.teamId {
                currentTeamList.append(participant)
            }
        }
        
        teamList = currentTeamList
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureUI() {
        view.addSubview(selfView)
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.topAnchor.constraint(equalTo: view.topAnchor, constant: (view.frame.height / 7) + 20).isActive = true
        selfView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: view.frame.width / 17 / 2).isActive = true
        selfView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -(view.frame.width / 17 / 2)).isActive = true
        selfView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        selfView.collectionView.register(GraphCell.self, forCellWithReuseIdentifier: GraphCell.identifier)
        
        selfView.collectionView.delegate = self
        selfView.collectionView.dataSource = self
 
        self.selfView.collectionView.reloadData()
        
        // 상단 좌측 우측 가장자리 라벨
        selfView.barChartView.xAxis.drawLabelsEnabled = false
        selfView.barChartView.rightAxis.enabled = false
        selfView.barChartView.leftAxis.enabled = false
        //selfView.barChartView
        
        // 그래프 세로 줄
        selfView.barChartView.xAxis.drawGridLinesEnabled = false
        
        // 상단 가장자리 라인
        selfView.barChartView.xAxis.drawAxisLineEnabled = false
        
        segmentView.center = CGPoint(x: view.frame.width / 2, y: (view.frame.height / 7))
        view.addSubview(segmentView)
        segmentView.backgroundColor = UIColor.white
        
        bind(teamList: teamList)
        
        segmentView.selectedSegmentIndex = 0
        firstSelectSegment()
    }
   
    func bind(teamList: [Participant]) {
        segmentView.rx.selectedSegmentIndex.subscribe(
            onNext: { [unowned self] index in
                switch index {
                case 0:
                    var dataArray: [Double] = []
                    for participant in teamList {
                        dataArray.append((participant.stats?.totalDamageDealtToChampions)!)
                    }
                    changeData(dataArray: dataArray)
                case 1:
                    var dataArray: [Double] = []
                    for participant in teamList {
                        dataArray.append((participant.stats?.visionScore)!)
                    }
                    changeData(dataArray: dataArray)
                case 2:
                    var dataArray: [Double] = []
                    for participant in teamList {
                        dataArray.append(Double((participant.stats?.totalMinionsKilled)!))
                    }
                    changeData(dataArray: dataArray)
                case 3:
                    var dataArray: [Double] = []
                    for participant in teamList {
                        dataArray.append(Double((participant.stats?.goldEarned)!))
                    }
                    changeData(dataArray: dataArray)
                default:
                    return
                }
                
            }
        ).disposed(by: disposeBag)
    }
    
    func firstSelectSegment() {
        var dataArray: [Double] = []
        for participant in teamList {
            dataArray.append((participant.stats?.totalDamageDealtToChampions)!)
        }
        changeData(dataArray: dataArray)
    }
    
    func changeData(dataArray: [Double]) {
        var dataEntries : [BarChartDataEntry] = []
        for index in 0...dataArray.count-1 {
            let dataEntry = BarChartDataEntry(x: Double(index), y: Double(dataArray[index]))
            dataEntries.append(dataEntry)
        }
        let chartDataSet = BarChartDataSet(entries:dataEntries, label: "")
                
        let format = NumberFormatter()
        format.numberStyle = .none
        let formatter = DefaultValueFormatter(formatter: format)
        
        let chartData = BarChartData(dataSet: chartDataSet)
        chartData.setValueFormatter(formatter)
   
        
        selfView.barChartView.data = chartData
        selfView.barChartView.animate(xAxisDuration: 1.5, yAxisDuration: 1.5)
    }
    
}
