//  ContentView.swift
//  HometaskPipedrive
//  Created by Анастасия Набатова on 22/2/24.

import SwiftUI

struct PersonsView: View {
    
    @ObservedObject private var viewModel = PersonsViewModel()
    @State private var searchText = ""
    @State private var showNoResults = false
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                SearchBar(text: $searchText)
                    .padding(.horizontal)
                List {
                    let filteredPersons = viewModel.allPersons.filter {
                        self.searchText.isEmpty ? true : (($0.firstName ?? "") + " " + ($0.lastName ?? "")).lowercased().contains(searchText.lowercased())
                    }
                    if filteredPersons.isEmpty {
                        Spacer()
                        Text("No results")
                            .font(.custom("Calibri", size: 16))
                            .foregroundColor(.black)
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .accessibilityLabel(Text("No results found"))
                            .accessibilityIdentifier("NoResultsLabel")
                            .accessibility(addTraits: .isStaticText)
                            .accessibility(hidden: !showNoResults)
                        Spacer()
                            .onAppear {
                                self.showNoResults = true
                            }
                    } else {
                        ForEach(filteredPersons) { person in
                            NavigationLink(destination: PersonDetailView(person: person)) {
                                HStack() {
                                    Text((person.firstName?.replacingOccurrences(of: "[Sample] ", with: "") ?? ""))
                                        .fontWeight(.regular)
                                        .foregroundColor(.black)
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.5)
                                    Text(person.lastName ?? "" )
                                        .fontWeight(.regular)
                                        .foregroundColor(.black)
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.5)
                                }
                            }
                            .foregroundColor(Color("GreenPipedrive"))
                        }
                    }
                }
                .onAppear {
                    viewModel.fetchData()
                }
                .alert(item: $viewModel.error) { error in
                    Alert(title: Text(error.errorDescription))
                }
            }
            .padding()
            .accessibilityValue("Number of persons: \(viewModel.allPersons.count)")
        }
        .accentColor(.black)
    }
}

#Preview {
    PersonsView()
}


