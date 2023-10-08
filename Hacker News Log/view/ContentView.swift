//
//  ContentView.swift
//  Hacker News Log
//
//  Created by Mufrat Karim Aritra on 10/7/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = NetworkModelManager()
    
    var body: some View {
        NavigationView{
            VStack {
                List(model.articles) { article in
                    NavigationLink(destination: DetailView(url: article.url)) {
                        HStack {
                            VStack {
                                Text("\(String(article.points)) points")
                                    .font(.custom("Snell Roundhand", size: 20))
                                    .bold()
                                Text("\(String(article.num_comments)) comments")
                                    .font(.custom("Chalkduster", size: 10))
                            }
                            Text(article.title)
                                .padding(.horizontal).lineLimit(2)
                        }
                    }
                    .listRowSeparator(.visible)
                    .listSectionSeparator(.visible)
                    .padding(EdgeInsets())
                    
                }
                .navigationTitle("Hacker News Log")
                .navigationBarTitleDisplayMode(.inline)
                
            }
            
            
        }
        .onAppear(perform: model.fetchData)
        
        
    }
}

#Preview {
    ContentView()
}
