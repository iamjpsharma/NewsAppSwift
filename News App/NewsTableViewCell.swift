//
//  NewsTableViewCell.swift
//  News App
//
//  Created by jaiprakash sharma on 14/10/23.
//

import UIKit
import SDWebImage

class NewsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var sourceName: UILabel!
    @IBOutlet weak var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        card.dropShadow()

    }
    
    func configure(with newsArticle: Article) {
        newsTitle.text = newsArticle.title
        newsImage.layer.cornerRadius = 8
        sourceName.text = newsArticle.source.name
        newsImage.sd_setImage(with: URL(string: newsArticle.urlToImage ?? ""), placeholderImage: UIImage(named: "Logo.png"))
        
        if let date = ISO8601DateFormatter().date(from:newsArticle.publishedAt) {
            time.text = date.relativeTime()
        }
        time.text = newsArticle.publishedAt
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
