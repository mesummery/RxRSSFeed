//
//  ListCell.swift
//  MAF-SwiftCompe
//
//  Created by SaikaYamamoto on 2015/09/23.
//  Copyright (c) 2015年 SaikaYamamoto. All rights reserved.
//

import UIKit
import SDWebImage
import HTMLReader

/*
 * RSS List Cell
 */
class ListCell: UITableViewCell {

    /// rssのimageView
    @IBOutlet private weak var rssImage: UIImageView!
    
    /// タイトルLabel
    @IBOutlet private weak var titleLabel: UILabel!

    /// 日付Label
    @IBOutlet private weak var authorLabel: UILabel!
    
    /// Label Container
    @IBOutlet weak var labelContainer: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        // Color
        let whiteColor = UIColor.whiteColor()
        let themeColor = THEME_COLOR
        let pointColor = POINT_COLOR
        titleLabel.textColor = (highlighted) ? whiteColor : themeColor
        authorLabel.textColor = (highlighted) ? whiteColor : pointColor
        labelContainer.backgroundColor = (highlighted) ? themeColor : whiteColor
    }
    
    /**
     Cell構成
     
     - parameter entity: entity
     */
    func configureCell(entity entity: Entry) {
        //Image
        let html = HTMLDocument(string: (entity.content))
        rssImage.sd_setImageWithURL(ParseUtil().parseImgUrl(html))
        
        // Title
        titleLabel.text = entity.title

        // Author
        authorLabel.text = ParseUtil().parseAuthor(html)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
