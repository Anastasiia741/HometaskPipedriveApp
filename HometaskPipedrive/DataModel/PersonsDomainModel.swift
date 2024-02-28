//  PersonsDomainModel.swift
//  HometaskPipedrive
//  Created by Анастасия Набатова on 24/2/24.

import Foundation

struct PersonsDomainModel: Identifiable {
    let id: Int32?
    let companyId: Int32?
    let name: String?
    let firstName: String?
    let lastName: String?
    let phone: [String?]
    let email: [String?]
    let updateTime: String?
    let addTime: String?
    let im: [String?] 
}
