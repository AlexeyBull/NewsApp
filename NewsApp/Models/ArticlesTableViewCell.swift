//
//  ArticlesTableViewCell.swift
//  NewsApp
//
//  Created by Admin on 29.05.2020.
//  Copyright © 2020 AlexeyBull. All rights reserved.
//

import UIKit

class ArticlesTableViewCell: UITableViewCell {
    
    // MARK: - Additional struct
    
    struct State {
        var title: String?
        var urlToImage: String?
    }
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    
    //MARK: -

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
