//
//  GetVersion.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/07/27.
//

import Foundation
import Alamofire
import SwiftyJSON
import RxSwift

class Version {
    
    static var loading: BehaviorSubject<Bool> = .init(value: false)
    
    static func getVersion() {
        loading.onNext(true)
        let url = URL(string: "https://ddragon.leagueoflegends.com/realms/kr.json")!
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
            let json = JSON(value)
                DATA_DRAGON.VERSION = json["v"].stringValue
                loading.onNext(false)
            case .failure(let error):
                print(error)
                loading.onNext(false) // 에러 처리 하자
            }
        }
    }
    
}
