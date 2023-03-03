//
//  DiscoverHeaderCell.swift
//  HotelsProject
//
//  Created by Adlan Nourindiaz on 02/03/23.
//

import UIKit

class DiscoverHeaderCell: UITableViewCell {

    static let identifier = "DiscoverHeaderCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var settingBar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCell()

    }

    func setupCell() {
        subtitleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        searchBar.layer.cornerRadius = 15
        searchBar.clipsToBounds = true
        
        settingBar.image = UIImage(named: "setting")
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
