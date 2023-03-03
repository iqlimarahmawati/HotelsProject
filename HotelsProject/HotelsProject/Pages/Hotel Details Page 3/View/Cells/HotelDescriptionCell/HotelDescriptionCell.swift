//
//  HotelDescriptionCell.swift
//  HotelsProject
//
//  Created by Adlan Nourindiaz on 02/03/23.
//

import UIKit

class HotelDescriptionCell: UITableViewCell {

    @IBOutlet weak var hotelName: UILabel!
    @IBOutlet weak var hotelDesc: UILabel!
    
    static let identifier = "HotelDescriptionCell"

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCell()
    }
    
    func setupCell() {
        hotelName.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        hotelDesc.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    
        
    }
    
    func configure(model: HotelModel?) {
        hotelName.text = model?.name
        hotelDesc.text = model?.desc
    }
    

    
}
