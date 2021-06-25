//
//  ApiError.swift
//  VivinoTest
//
//  Created by Borja Saez de Guinoa Vilaplana on 3/5/21.
//

import Foundation

public enum APIError: Error {
    case generalServiceError
    case badRequestError
    case unauthorisedError
    case serviceUnavailable
    case jsonParsingError
}

public enum StatusCodes: Int {
    // MARK: - Client errors
    case Code400BadRequest = 400
    case Code401Unauthorised = 401
    case Code403Forbidden = 403
    case Code404NotFound = 404
    
    // MARK: - Server errors
    case Code500InternalServerError = 500
    case Code501NotImplemented = 501
    case Code502BadGateway = 502
    case Code503ServiceUnavailable = 503
    
    var code: Int {
        return rawValue
    }
    
    static func apiErrorType(_ statusCode: Int) -> APIError {
        switch statusCode {
        case StatusCodes.Code400BadRequest.code:
            return APIError.badRequestError
        case StatusCodes.Code401Unauthorised.code:
            return APIError.unauthorisedError
        case StatusCodes.Code500InternalServerError.code:
            return APIError.serviceUnavailable
        default:
            return APIError.generalServiceError
        }
    }
}
