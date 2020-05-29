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
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "ArticlesTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
}
// MARK: - UITableViewDelegate, UITableViewDataSource

extension MainPageViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ArticlesTableViewCell else { return UITableViewCell() }
        //let article = articles[indexPath.row]
        //let cellState = ArticlesTableViewCell.State(title: article.title, urlToImage: article.urlToImage)
        return cell
    }
    
    /* func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        push(with: articles[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }*/
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
}

// MARK: - Extension

/*extension MainPageViewController {

func push(with character: Articles) {
    let articleInfoVC = ArticlePageViewController(nibName: "ArticlePageViewController", bundle: nil)
    articleInfoVC.articles = articles
    navigationController?.pushViewController(articleInfoVC, animated: true)
    }
}*/
