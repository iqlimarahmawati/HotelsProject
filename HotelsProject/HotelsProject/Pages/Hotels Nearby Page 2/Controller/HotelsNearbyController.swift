//
//  HotelsNearbyController.swift
//  HotelsProject
//
//  Created by Adlan Nourindiaz on 02/03/23.
//

import UIKit

class HotelsNearbyController: UIViewController {

    @IBOutlet weak var tableView : UITableView!
    
    var dataHotel: [HotelModel] = []
    
    static let identifier = "HotelsNearbyController"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setTable()
    }

    func setTable() {
        
        tableView.register(UINib(nibName: "TitleHotelsCell", bundle: nil), forCellReuseIdentifier: TitleHotelsCell.identifier)
        tableView.register(UINib(nibName: "HotelsNearbyListCell", bundle: nil), forCellReuseIdentifier: HotelsNearbyListCell.identifier)

        tableView.delegate = self
        tableView.dataSource = self
    }
    
}
extension HotelsNearbyController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        default:
            return dataHotel.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleHotelsCell.identifier, for: indexPath) as? TitleHotelsCell else {
                return UITableViewCell()
            }
            
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HotelsNearbyListCell.identifier, for: indexPath) as? HotelsNearbyListCell else {
                return UITableViewCell()
            }
            cell.configure(model: dataHotel[indexPath.row])
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
}
