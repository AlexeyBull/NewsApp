//
//  ArticlePageViewController.swift
//  NewsApp
//
//  Created by Admin on 29.05.2020.
//  Copyright © 2020 AlexeyBull. All rights reserved.
//

import UIKit

class ArticlePageViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    var article: Articles?
    
    // MARK: - lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
