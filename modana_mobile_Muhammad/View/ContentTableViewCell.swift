//
//  ContentTableViewCell.swift
//  modana_mobile_Muhammad
//
//  Created by Muhammad Reynaldi on 12/03/20.
//  Copyright © 2020 -. All rights reserved.
//

import UIKit

class ContentTableViewCell: UITableViewCell {

    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCellInterface()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
extension ContentTableViewCell{
    func setCell(description:String, link:String, category:String) {
        self.descLabel.text = description
        self.linkLabel.text = link
        self.categoryLabel.text = category
    }
    
    private func setCellInterface() {
        outerView.outerRound()
    }
}
