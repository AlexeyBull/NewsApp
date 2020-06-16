//
//  ArticlesTableViewCell.swift
//  NewsApp
//
//  Created by Admin on 29.05.2020.
//  Copyright © 2020 AlexeyBull. All rights reserved.
//

import UIKit

class ArticlesTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    // MARK: - Internal methods
    
    func configure(with article: Articles) {
        articleTitle.text = article.title
        if article.urlToImage != nil {
            articleImage.loadImage(by: article.urlToImage!)
        } else {
            articleImage.image = UIImage(named: "logo")
        }
        articleImage.layer.cornerRadius = 15
        dateLabel.text = article.publishedAt
    }
}
