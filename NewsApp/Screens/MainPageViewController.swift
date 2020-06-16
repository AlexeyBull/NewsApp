//
//  MainPageViewController.swift
//  NewsApp
//
//  Created by Admin on 29.05.2020.
//  Copyright © 2020 AlexeyBull. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    var articles = [Articles]()
    let service = DataProvider()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "TechNews"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ArticlesTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        loadNews()
    }
    
    // MARK: - Methods

    func loadNews() {
        service.loadCache(onComplete: { [weak self] (articles) in
            self?.articles = articles
            self?.tableView.reloadData()
        })
        service.loadArticles(onComplete: { [weak self] (articles) in
            self?.articles = articles
            self?.tableView.reloadData()
        }) { (error) in
            print(error.localizedDescription)
        }
    }
}
// MARK: - UITableViewDelegate, UITableViewDataSource

extension MainPageViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ArticlesTableViewCell else { return UITableViewCell() }
        cell.configure(with: articles[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        push(with: articles[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
}
// MARK: - Extensions

extension MainPageViewController {
    
    func push(with articles: Articles) {
        let articleInfoVC = ArticlePageViewController(nibName: "ArticlePageViewController", bundle: nil)
        articleInfoVC.article = articles
        navigationController?.pushViewController(articleInfoVC, animated: true)
    }
}
