//  PersonsService.swift
//  HometaskPipedrive
//  Created by Анастасия Набатова on 22/2/24.

import Foundation

enum NetworkErrors: Error, Identifiable {
    
    var id: String {
        errorDescription
    }
    
    case dataNotReceivedError
    case parsingError
    
    var errorDescription: String {
        switch self {
        case .dataNotReceivedError:
            return "Data not received from server"
        case .parsingError:
            return "Error occurred while parsing data"
        }
    }
}

final class PersonsService {
    
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func fetchPersons(request: URLRequest?) async throws -> PersonsResponse {
        
        guard let request else {
            throw NetworkErrors.parsingError
        }
        
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkErrors.dataNotReceivedError
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let personsResponse = try decoder.decode(PersonsResponse.self, from: data)
            return personsResponse
        } catch {
            throw NetworkErrors.parsingError
        }
    }
}


