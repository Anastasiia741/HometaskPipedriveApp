//  Entity+CoreDataProperties.swift
//  HometaskPipedrive
//  Created by Анастасия Набатова on 24/2/24.

import Foundation
import CoreData

@objc(PersonsEntity)
public class PersonsEntity: NSManagedObject {
    var dto: PersonsDomainModel {
        PersonsDomainModel(id: id,
                           companyId: companyId,
                           name: name,
                           firstName: firstName,
                           lastName: lastName,
                           phone: [phone],
                           email: [email],
                           updateTime: updateTime,
                           addTime: addTime,
                           im: [im])
    }
}

extension PersonsEntity: Identifiable {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonsEntity> {
        return NSFetchRequest<PersonsEntity>(entityName: "PersonsEntity")
    }
    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var companyId: Int32
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var addTime: String?
    @NSManaged public var updateTime: String?
    @NSManaged public var phone: String?
    @NSManaged public var email: String?
    @NSManaged public var im: String?
}



