//
//  HistoryTableViewCell.swift
//  iPhone Unit Converter Application
//
//  Created by Fazal on 2021-03-15.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var unitIcon: UIImageView!
    
    @IBOutlet weak var labelConversionHistory: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    }
}
