//  DataController.swift
//  HometaskPipedrive
//  Created by Анастасия Набатова on 23/2/24.

import Foundation
import CoreData

final class CoreDataManager: ObservableObject {
    
    private let container = NSPersistentContainer(name: "PersonModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error  {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func savePersonsToCoreData(_ persons: [Person]) throws {
        let context = container.viewContext
        
        for person in persons {
            let personEntity = PersonsEntity(context: context)
            personEntity.id = person.id ?? 0
            personEntity.companyId = person.companyId ?? 0
            personEntity.name = person.name
            personEntity.firstName = person.firstName
            personEntity.lastName = person.lastName
            personEntity.addTime = person.addTime
            personEntity.updateTime = person.updateTime
            if let phones = person.phone {
                phones.forEach { phone in
                    if let value = phone.value {
                        personEntity.phone = value
                    }
                    
                }
            }
            if let emails = person.email {
                emails.forEach { person in
                    if let value = person.value{
                        personEntity.email = value
                    }
                }
            }
            if let im = person.im {
                im.forEach { person in
                    if let value = person.value {
                        personEntity.im = value
                    }
                }
            }
            try context.save()
        }
    }
    
    func loadPersons() -> [PersonsDomainModel] {
        let request = PersonsEntity.fetchRequest()
        let results = try? container.viewContext.fetch(request)
        return results?.map{$0.dto} ?? []
    }
}
