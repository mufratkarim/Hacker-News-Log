//
//  NetworkModelManager.swift
//  Hacker News Log
//
//  Created by Mufrat Karim Aritra on 10/7/23.
//

import Foundation

class NetworkModelManager: ObservableObject {
    
    @Published var articles = [Article]()
    
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, err in
                if err == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.articles = results.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            
            task.resume()
        }
    }
}
