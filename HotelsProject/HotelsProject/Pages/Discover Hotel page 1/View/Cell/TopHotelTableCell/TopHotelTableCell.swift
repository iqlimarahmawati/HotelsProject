//
//  TopHotelTableCell.swift
//  HotelsProject
//
//  Created by Adlan Nourindiaz on 02/03/23.
//

import UIKit

class TopHotelTableCell: UITableViewCell {

    static let identifier = "TopHotelTableCell"
    
    var dataTopHotel: [HotelModel] = []
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UINib(nibName: "TopHotelCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: TopHotelCollectionViewCell.identifier)
        collectionView.layer.masksToBounds = false
//        collectionView.backgroundColor = .green

        return collectionView
        
    }()

    
    func collectionViewSetup() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func setupTableCell() {
        contentView.addSubview(collectionView)
        collectionViewSetup()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }


    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        contentView.addSubview(collectionView)
        
//        collectionView.delegate = self
//        collectionView.dataSource = self
    }
}

extension TopHotelTableCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataTopHotel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopHotelCollectionViewCell.identifier, for: indexPath) as? TopHotelCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(model: dataTopHotel[indexPath.row])
        cell.setupCell()

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 16, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 1.5, height: 190)
    }
    
}
