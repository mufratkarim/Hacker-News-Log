//
//  ArticleData.swift
//  Hacker News Log
//
//  Created by Mufrat Karim Aritra on 10/7/23.
//

import Foundation

struct Results: Decodable {
    let hits: [Article]
}

struct Article: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let title: String
    let points: Int
    let num_comments: Int
    let url: String?
}
