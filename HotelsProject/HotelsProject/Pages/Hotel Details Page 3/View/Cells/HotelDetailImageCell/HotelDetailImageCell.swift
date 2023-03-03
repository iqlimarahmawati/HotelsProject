//
//  HotelDetailImageCell.swift
//  HotelsProject
//
//  Created by Adlan Nourindiaz on 02/03/23.
//

import UIKit

class HotelDetailImageCell: UITableViewCell {
    
    @IBOutlet weak var hotelImage: UIImageView!
    
    static let identifier = "HotelDetailImageCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCell()
    }

    func setupCell() {
        
    }
    
    func configure(model: HotelModel) {
        hotelImage.image = UIImage(named: model.image)
    }
}
