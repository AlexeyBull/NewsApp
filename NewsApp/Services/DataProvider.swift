//
//  DataProvider.swift
//  NewsApp
//
//  Created by Admin on 31.05.2020.
//  Copyright © 2020 AlexeyBull. All rights reserved.
//

import CoreData

final class DataProvider {
    
    private let context = CoreDataStack.shared.context
    private let service = NetworkService()
    
    func loadCache(onComplete: @escaping ([Articles]) -> Void) {
        let request: NSFetchRequest<ArticleEntity> = ArticleEntity.fetchRequest()
        request.fetchLimit = 10
        
        let articleEntities = try? self.context.fetch(request)
        
        if let articles = articleEntities, !articles.isEmpty {
            let articleModels = articles.map {
                Articles(title: $0.title, description: $0.descr, urlToImage: $0.urlToImage, publishedAt: $0.publishedAt )
            }
            onComplete(articleModels)
        } else {
            
        }
    }
    
    func loadArticles(onComplete: @escaping ([Articles]) -> Void, onError: @escaping (Error) -> Void) {
        service.loadArticles(onComplete: { [weak self] (articles) in
            guard let self = self else { return }
            
            for item in articles {
                let articleEntity = ArticleEntity(context: self.context)
                articleEntity.title = item.title
                articleEntity.descr = item.description
                articleEntity.urlToImage = item.urlToImage
                articleEntity.publishedAt = item.publishedAt
            }
            
            try? self.context.save()
            
            onComplete(articles)
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
}
