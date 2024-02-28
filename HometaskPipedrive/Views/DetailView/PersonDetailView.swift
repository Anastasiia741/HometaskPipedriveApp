//  PersonDetailView.swift
//  HometaskPipedrive
//  Created by Анастасия Набатова on 22/2/24.

import SwiftUI

struct PersonDetailView: View {
    
    private let person: PersonsDomainModel
    
    init(person: PersonsDomainModel) {
        self.person = person
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                if let imageName = person.im.first, !(imageName?.isEmpty ?? true) {
                    Image(imageName ?? "Profile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.green, lineWidth: 1.5))
                } else {
                    Image("Profile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color("GreenPipedrive"), lineWidth: 1.5))
                }
                VStack(alignment: .leading, spacing: 4) {
                    Text("Name: \(person.firstName?.replacingOccurrences(of: "[Sample]", with: "") ?? "")")
                        .fontWeight(.bold)
                    Text("Surname: \(person.lastName ?? "")")
                        .fontWeight(.bold)
                }
                .padding(.leading, 16)
            }
            VStack(alignment: .leading, spacing: 4) {
                Text("Phone:")
                    .fontWeight(.bold)
                Text(person.phone.compactMap { $0 }.joined(separator: ", "))
                Text("Email:")
                    .fontWeight(.bold)
                Text(person.email.compactMap { $0 }.joined(separator: ", "))
                Text("Account creation date:")
                    .fontWeight(.bold)
                Text(person.addTime ?? "")
                Text("Update date:")
                    .fontWeight(.bold)
                Text(person.updateTime ?? "")
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 3)
        .accessibilityLabel("Person Details")
        .accessibilityValue("Name: \(person.firstName?.replacingOccurrences(of: "[Sample]", with: "") ?? ""), Surname: \(person.lastName ?? ""), \(person.phone.compactMap { $0 }.joined(separator: ", ")) ")
        .accessibilityHint("View detailed information about the person")
    }
}
