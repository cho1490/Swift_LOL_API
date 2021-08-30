//
//  AlamofireManager.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/07/27.
//

import Foundation
import Alamofire

final class AlamofireManager {
    
    // singleton
    static let shared = AlamofireManager()
    
    let interceptors = Interceptor(interceptors: [BaseInterceptor()] )
    
    let monitors = [Logger()] as [EventMonitor]
    
    var session: Session
    
    private init() {
        session = Session(interceptor: interceptors, eventMonitors: monitors)
    }
    
}
