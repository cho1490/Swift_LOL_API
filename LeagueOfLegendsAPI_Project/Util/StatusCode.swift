//
//  StatusCode.swift
//  LeagueOfLegendsAPI_Project
//
//  Created by 조상현 on 2021/07/27.
//

import Foundation

enum StatusCode: Int, Error {
    
    // MARK: - Type
    
    enum ResponseType {
        
        /// OK!!
        case success
        
        /// clientError: 4xx Error
        case clientError
        
        /// serverError: 5xx Error
        case serverError
        
        /// undefined: unknown
        case undefinedError
        
    }
    
    // MARK: - 200
    
    /// Only 200 response codes are guaranteed to return a response body as JSON.
    case success = 200
    
    // MARK: - 4XX

    /// 4xx 클래스의 오류 코드는 클라이언트가 유효한 요청을 제공하지 못했음을 나타냅니다. 다음은 API를 사용할 때 발생할 수 있는 가장 일반적인 4xx 클래스의 오류 코드입니다.
    
    /// 400 (Bad Request) 이 오류는 요청에 구문 오류가 있으므로 요청이 거부되었음을 나타냅니다. 클라이언트는 구문이나 요청을 수정하지 않고 유사한 요청을 계속해서는 안 됩니다.
    case badRequest = 400
    
    /// 401 (Unauthorized) 이 오류는 요청 중인 요청에 필요한 인증 자격 증명(예: API 키)이 포함되어 있지 않아 클라이언트 액세스가 거부되었음을 나타냅니다. 클라이언트는 요청에 API 키를 포함하지 않고 유사한 요청을 계속해서는 안 됩니다.
    case unauthorized
    
    /// 403 (Forbidden) 이 오류는 서버가 요청을 이해했지만 승인을 거부했음을 나타냅니다. 유효하지 않은 경로 또는 유효하지 않은 인증 자격 증명(예: API 키) 간에 구분이 없습니다. 클라이언트는 유사한 요청을 계속해서는 안됩니다.
    case forbidden = 403
    
    /// 404 (Not Found) 이 오류는 서버가 API 요청과 일치하는 항목을 찾지 못했음을 나타냅니다. 상태가 일시적인지 영구적인지 여부는 표시되지 않습니다.
    case dataNotFound
    
    case methodNotAllowed
    
    /// 415 (Unsupported Media Type) 이 오류는 요청 본문이 지원되지 않는 형식이기 때문에 서버가 요청 서비스를 거부하고 있음을 나타냅니다.
    case unsupportedMediaType = 415
    
    /// 429 (Rate Limit Exceeded) 이 오류는 애플리케이션이 주어진 기간 동안 허용된 최대 할당 API 호출 수를 소진했음을 나타냅니다. 클라이언트가 Rate Limit Exceeded 응답을 수신하면 클라이언트는 이 응답을 처리하고 Retry-After 헤더에 표시된 기간(초) 동안 향후 API 호출을 중단해야 합니다. 이 정책을 위반하는 애플리케이션은 API의 무결성을 유지하기 위해 액세스가 비활성화될 수 있습니다. 속도 제한이 있는지 여부와 이를 방지하는 방법에 대한 자세한 내용은 아래의 속도 제한 문서를 참조하십시오.
    case rateLimitExceeded = 429
    
    // MARK: - 5XX

    /// 5xx 클래스 또는 오류 코드는 서버가 오류가 발생했거나 요청을 수행할 수 없음을 인식하고 있음을 나타냅니다. 다음은 API를 사용할 때 발생할 수 있는 가장 일반적인 5xx 클래스의 오류 코드입니다.
    
    /// 500 (Internal Server Error) 이 오류는 서버가 API 요청을 수행하지 못하게 하는 예기치 않은 조건 또는 예외를 나타냅니다.
    case internalServerError = 500
    
    
    case badGateway = 502
    
    /// 503 (Service Unavailable) 이 오류는 알 수 없는 이유로 서버가 현재 요청을 처리할 수 없음을 나타냅니다. Service Unavailable 응답은 잠시 후 완화될 일시적인 상태를 의미합니다.
    case serviceUnavailable
    
    case gatewayTimeout
    
    // MARK: - return
    
    var responseType: ResponseType {
        
        switch self.rawValue {
        case 200:
            return .success
        case 400..<430:
            return .clientError
        case 500..<505:
            return .serverError
        default:
            return .undefinedError
        }
        
    }
    
}

extension HTTPURLResponse {
    
    var status: StatusCode? {
        return StatusCode(rawValue: statusCode)
    }
    
}
