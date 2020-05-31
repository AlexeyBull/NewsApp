//
//  ArticleEntity+CoreDataProperties.swift
//  NewsApp
//
//  Created by Admin on 31.05.2020.
//  Copyright © 2020 AlexeyBull. All rights reserved.
//
//

import Foundation
import CoreData


extension ArticleEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ArticleEntity> {
        return NSFetchRequest<ArticleEntity>(entityName: "ArticleEntity")
    }

    @NSManaged public var title: String?
    @NSManaged public var descr: String?
    @NSManaged public var urlToImage: String?
    @NSManaged public var publishedAt: String?

}
