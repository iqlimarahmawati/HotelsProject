//
//  TitleHotelsCell.swift
//  HotelsProject
//
//  Created by Adlan Nourindiaz on 02/03/23.
//

import UIKit

class TitleHotelsCell: UITableViewCell {

    @IBOutlet weak var titleHotels: UILabel!

    
    static let identifier = "TitleHotelsCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
       setupCell()
    }

    func setupCell() {
        titleHotels.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        
    }
    
}
