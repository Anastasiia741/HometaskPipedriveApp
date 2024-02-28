//  PersonEntity.swift
//  HometaskPipedrive
//  Created by Анастасия Набатова on 23/2/24.

import Foundation
import CoreData

@objc(PersonEntity)

public class PersonEntity: NSManagedObject {
    
    @NSManaged public var companyId: Int32
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var phone: String?
    @NSManaged public var email: String?
    @NSManaged public var addTime: String?
}
