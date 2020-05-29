//
//  TechNews.swift
//  NewsApp
//
//  Created by Admin on 29.05.2020.
//  Copyright © 2020 AlexeyBull. All rights reserved.
//

import Foundation

struct TechNews: Codable{
    var status: String
    var totalResults: Int
    var articles: [Articles]
}
