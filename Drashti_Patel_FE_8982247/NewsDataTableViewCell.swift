//
//  NewsDataTableViewCell.swift
//  Drashti_Patel_FE_8982247
//
//  Created by user236597 on 4/11/24.
//

import UIKit

class NewsDataTableViewCell: UITableViewCell {

    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var formHomeLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    func setupCell (data: NewsData) {
        authorLabel.text = "Author: \(data.author ?? "")"
        sourceLabel.text = "Source: \(data.source ?? "")"
        titleLabel.text = "Title: \(data.title ?? "")"
        formHomeLabel.text = "From: \(data.from ?? "")"
        contentLabel.text = "Content: \(data.content ?? "")"
        cityLabel.text = "City Name: \(data.cityName ?? "")"
    }

}

