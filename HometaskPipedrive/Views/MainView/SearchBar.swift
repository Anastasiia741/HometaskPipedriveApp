//  SearchBar.swift
//  HometaskPipedrive
//  Created by Анастасия Набатова on 22/2/24.

import SwiftUI

struct SearchBar: View {
   
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search Pipedrive", text: $text)
                .font(.custom("Calibri", size: 14))
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray5))
                .cornerRadius(8)
                .accessibilityIdentifier("searchBar")
                .accessibilityLabel("Search Pipedrive")
                .accessibilityHint("Enter text to search")
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        if !text.isEmpty {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .frame(maxWidth: .infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PersonsView()
    }
}
