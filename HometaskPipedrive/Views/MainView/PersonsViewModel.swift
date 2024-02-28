//  PersonsViewModel.swift
//  HometaskPipedrive
//  Created by Анастасия Набатова on 22/2/24.

import Foundation
import CoreData

final class PersonsViewModel: ObservableObject {
    
    private let personsService = PersonsService()
    private let coreDataManager = CoreDataManager()
    @Published private(set) var allPersons: [PersonsDomainModel] = []
    @Published var error: NetworkErrors?
    
    func fetchData() {
        let persons = coreDataManager.loadPersons()
        if !persons.isEmpty {
            allPersons = persons
        } else {
            Task {
                do {
                    let request = ApiRequest().makeRequest()
                    let personResponse = try await personsService.fetchPersons(request: request)
                    DispatchQueue.main.async {
                        self.allPersons = personResponse.data.map{$0.dto}
                        try? self.coreDataManager.savePersonsToCoreData(personResponse.data)
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.error = error as? NetworkErrors
                    }
                }
            }
        }
    }
}



