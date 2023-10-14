//
//  ViewController.swift
//  News App
//
//  Created by jaiprakash sharma on 14/10/23.
//

import UIKit
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView?
    
    var articles: [Article] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the data source and delegate for the UITableView
        tableView?.dataSource = self
        tableView?.delegate = self

        NewsAPIClient.shared.fetchNews { result in
            switch result {
            case .success(let fetchedArticles):
                // Update the data source and reload the table view on the main thread
                DispatchQueue.main.async {
                    self.articles = fetchedArticles
                    self.tableView?.reloadData()
                }
            case .failure(let error):
                // Handle the error
                print("Error: \(error.localizedDescription)")
            }
        }
    }

    // Implement UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        let article = articles[indexPath.row]
        cell.configure(with: article)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webPage = WebPageViewController.newInstance()
        let article = articles[indexPath.row]
        webPage.title = article.title
        webPage.url = article.url
        webPage.allowUrlVisits = false

        self.navigationController?.pushViewController(webPage, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }

}


