//
//  RoomListCollectionViewCell.swift
//  HotelsProject
//
//  Created by Adlan Nourindiaz on 02/03/23.
//

import UIKit

class RoomListCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "RoomListCollectionViewCell"

    @IBOutlet weak var roomImage: UIImageView!
    
    @IBOutlet weak var titleRoom: UILabel!
    
    @IBOutlet weak var descRoom: UILabel!
    
    @IBOutlet weak var ratingIcons: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell() {
        self.contentView.layer.cornerRadius = 15
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
    }
    
    func configure(model: Room) {
        roomImage.image = UIImage(named: model.roomImg)
        titleRoom.text = model.roomTitle
        descRoom.text = model.roomDesc
        
    }

}
