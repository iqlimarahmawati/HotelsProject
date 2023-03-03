//
//  HotelDetailController.swift
//  HotelsProject
//
//  Created by Adlan Nourindiaz on 02/03/23.
//

import UIKit

enum HotelDetailSections: Int {
    
    case imageSection = 0
    case desc = 1
    case room = 2
}

class HotelDetailController: UIViewController {

    @IBOutlet weak var hotelDetailTable: UITableView!
    
    var hotelDetail: HotelModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }

    func setupTable() {
        
        hotelDetailTable.register(UINib(nibName: "HotelDetailImageCell", bundle: nil), forCellReuseIdentifier: HotelDetailImageCell.identifier)
        hotelDetailTable.register(UINib(nibName: "HotelDescriptionCell", bundle: nil), forCellReuseIdentifier: HotelDescriptionCell.identifier)
        hotelDetailTable.register(RoomListTableViewCell.self, forCellReuseIdentifier: RoomListTableViewCell.identifier)

        
        hotelDetailTable.delegate = self
        hotelDetailTable.dataSource = self
    }
    
    
}

extension HotelDetailController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 2:
            return 130
        default:
            return hotelDetailTable.rowHeight
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = HotelDetailSections(rawValue: indexPath.section)
        
        switch section {
        case .imageSection:
            guard let cell = hotelDetailTable.dequeueReusableCell(withIdentifier: HotelDetailImageCell.identifier, for: indexPath) as? HotelDetailImageCell else { return UITableViewCell() }
            
            cell.setupCell()
            guard let configDetail = hotelDetail else { return UITableViewCell() }
            cell.configure(model: configDetail)
            return cell

        case .desc:
            guard let cell = hotelDetailTable.dequeueReusableCell(withIdentifier: HotelDescriptionCell.identifier, for: indexPath) as? HotelDescriptionCell else { return UITableViewCell() }
            
            cell.configure(model: hotelDetail)
            
            return cell
        
        case .room:
            guard let cell = hotelDetailTable.dequeueReusableCell(withIdentifier: RoomListTableViewCell.identifier, for: indexPath) as? RoomListTableViewCell else {
                return UITableViewCell()}
            guard let roomData = hotelDetail?.room else {
                return UITableViewCell()
            }
            
            cell.dataRoom = roomData
            cell.setupTableCell()
            return cell

        default:
            return UITableViewCell()
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    
}
