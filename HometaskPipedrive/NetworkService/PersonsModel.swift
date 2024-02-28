//  Users.swift
//  HometaskPipedrive
//  Created by Анастасия Набатова on 22/2/24.

import Foundation

struct PersonsResponse: Decodable, Equatable {
    static func == (lhs: PersonsResponse, rhs: PersonsResponse) -> Bool {
        return true
    }
    
    let success: Bool
    let data: [Person]
}

struct Person: Decodable, Identifiable {
    var dto: PersonsDomainModel {
        PersonsDomainModel(id: id,
                           companyId: companyId,
                           name: name,
                           firstName: firstName,
                           lastName: lastName,
                           phone: phone?.map{$0.value} ?? [],
                           email: email?.map{$0.value} ?? [],
                           updateTime: updateTime,
                           addTime: addTime, 
                           im: im?.map{$0.value} ?? [])
    }
    
    let id: Int32?
    let companyId: Int32?
    let name: String?
    let firstName: String?
    let lastName: String?
    let phone: [Phone]?
    let email: [Email]?
    let updateTime: String?
    let addTime: String?
    let im: [Im]?
}

struct Phone: Decodable {
    let value: String?
}

struct Email: Decodable {
    let value: String?
}

struct Im: Decodable {
    let value: String?
}
