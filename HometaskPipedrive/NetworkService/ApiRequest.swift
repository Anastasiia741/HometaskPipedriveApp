//  ApiRequest.swift
//  HometaskPipedrive
//  Created by Анастасия Набатова on 24/2/24.

import Foundation

struct ApiRequest {
    
    func makeRequest() -> URLRequest? {
        
        var urlComponents = URLComponents.init()
        urlComponents.scheme = "https"
        urlComponents.host = "api.pipedrive.com"
        urlComponents.path = "/v1/persons"
        urlComponents.query = "api_token=\(ApiConstants.apiKey)"
        
        guard let url = urlComponents.url else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        return request
    }
}
