//
//  ContentView.swift
//  JPApexPredators
//
//  Created by Mohamed Makria on 20/05/2026.
//

import SwiftUI

struct ContentView: View {
    let predators = Predators()
    @State var searchText = ""
    @State var alphabetical = false
    
    var filteredDinos: [ApexPredator]{
        predators.sort(by: alphabetical)
        return predators.search(for: searchText)
    }
    
    var body: some View {
        NavigationStack{
            List(filteredDinos){ predator in
                NavigationLink{
                    Text(predator.name)
                }label: {
                   HStack {
                        Image(predator.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .shadow(color: .white, radius: 1)
                        
                        VStack(alignment: .leading){
                            //name
                            Text(predator.name)
                                .fontWeight(.bold)
                            
                            //type
                            Text(predator.type.rawValue.capitalized)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 13)
                                .padding(.vertical, 5)
                                .background(predator.type.background)
                                .clipShape(.capsule)
                        }
                    }
                }
                
            }
            .navigationTitle("Apex predators")
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            .animation(.default, value: searchText)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        alphabetical.toggle()
                        
                    } label: {
                        if alphabetical {
                            Image(systemName: "film")
                        } else {
                            Image(systemName: "textformat")
                        }
                        
                    }
                }
            }
            
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
