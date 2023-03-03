//
//  ViewController.swift
//  HotelsProject
//
//  Created by Adlan Nourindiaz on 02/03/23.
//

import UIKit

protocol DiscoverHotelProtocol {
    func seeder()
}

enum Sections: Int {
    
    case header = 0
    case topHotels = 1
    case hotelsNearbyHeader = 2
    case hotelsNearbyList = 3
}

class DiscoverHotelController: UIViewController, HotelsNearbyDelegate {

    @IBOutlet weak var discoverTable: UITableView!

    var hotelData: [HotelModel] = []
    
    
    // var opsional untuk deklarasikan agar bisa klik page ke 2
    var delegate: HotelsNearbyDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        delegate = self
    }
    
    func setupTable() {
        
        discoverTable.register(UINib(nibName: "DiscoverHeaderCell", bundle: nil), forCellReuseIdentifier: DiscoverHeaderCell.identifier)
        discoverTable.register(TopHotelTableCell.self, forCellReuseIdentifier: TopHotelTableCell.identifier)
        discoverTable.register(UINib(nibName: "HotelsNearbyHeaderCell", bundle: nil), forCellReuseIdentifier: HotelsNearbyHeaderCell.identifier)
        discoverTable.register(UINib(nibName: "HotelsNearbyListCell", bundle: nil), forCellReuseIdentifier: HotelsNearbyListCell.identifier)
        discoverTable.delegate = self
        discoverTable.dataSource = self
        seeder()
        
    }
    
    func moveToHotelsNearbyPage() {
        let vc = HotelsNearbyController()
        vc.dataHotel = self.hotelData
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func moveToHotelDetailPage(model: HotelModel) {
        let vc = HotelDetailController()
        vc.hotelDetail = model
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}

extension DiscoverHotelController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 3:
            return hotelData.count - 2
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0:
            return discoverTable.rowHeight
        case 1:
            return 210
        case 2:
            return discoverTable.rowHeight
        case 3:
            return discoverTable.rowHeight
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = Sections(rawValue: indexPath.section)
        
        switch section {
        case .header:
            guard let cell = discoverTable.dequeueReusableCell(withIdentifier: DiscoverHeaderCell.identifier) as? DiscoverHeaderCell else { return UITableViewCell() }
            
            return cell
            
        case .topHotels:
            guard let cell = discoverTable.dequeueReusableCell(withIdentifier: TopHotelTableCell.identifier) as? TopHotelTableCell else { return UITableViewCell() }
            cell.dataTopHotel = hotelData
            cell.setupTableCell()
            
            return cell
            
        case .hotelsNearbyHeader:
            guard let cell = discoverTable.dequeueReusableCell(withIdentifier: HotelsNearbyHeaderCell.identifier) as? HotelsNearbyHeaderCell else { return UITableViewCell() }

//            cell.hotelData = hotelData
            cell.delegate = self.delegate
            
            return cell
            
        case .hotelsNearbyList:
            guard let cell = discoverTable.dequeueReusableCell(withIdentifier: HotelsNearbyListCell.identifier) as?
                    HotelsNearbyListCell else { return UITableViewCell() }
          
            // func konfigurasi yang ada di HOTEL NEARBY LIST // PAGE KE 2
            cell.configure(model: hotelData[indexPath.row])
            
            return cell

            
        default:
            return UITableViewCell()
            
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 3 {
            moveToHotelDetailPage(model: hotelData[indexPath.row])
        }
    
    }
    
}








extension DiscoverHotelController: DiscoverHotelProtocol {
    
    
    func seeder() {
        let data1 = HotelModel(image: "hotel1", name: "Shang Hotel", address: "Street 12321", price: 300, rating: 4.3, desc: "Our hotel offers a unique blend of modern amenities and classic charm, ensuring that each and every guest enjoys an unforgettable stay. With beautifully appointed rooms, all featuring plush bedding, luxurious linens, and state-of-the-art technology, you'll feel right at home from the moment you arrive. Whether you're here for business or pleasure, our friendly and attentive staff is always on hand to ensure that your needs are met. And when it's time to unwind, head to our on-site restaurant and lounge, where you can savor delicious cuisine and signature cocktails. We also offer a range of meeting and event spaces, making us the ideal choice for everything from intimate gatherings to large-scale conferences.", room: [
            Room(roomImg: "room1", roomTitle: "Main bedroom", roomDesc: "Presidential Deluxe"),
            Room(roomImg: "room2", roomTitle: "Lesehan room", roomDesc: "kamarnya bikin sakit pinggang"),
            Room(roomImg: "room3", roomTitle: "Gelar tiker room", roomDesc: "Kasur pake tiker"),
            Room(roomImg: "room4", roomTitle: "Platinum Room", roomDesc: "Nyaman bangetttttt"),
            
            ])
        
        let data2 = HotelModel(image: "hotel2", name: "Shangrila Hotel", address: "Street 12321", price: 300, rating: 4.0, desc: "Our hotel offers a unique blend of modern amenities and classic charm, ensuring that each and every guest enjoys an unforgettable stay. With beautifully appointed rooms, all featuring plush bedding, luxurious linens, and state-of-the-art technology, you'll feel right at home from the moment you arrive. Whether you're here for business or pleasure, our friendly and attentive staff is always on hand to ensure that your needs are met. And when it's time to unwind, head to our on-site restaurant and lounge, where you can savor delicious cuisine and signature cocktails. We also offer a range of meeting and event spaces, making us the ideal choice for everything from intimate gatherings to large-scale conferences.", room: [
            Room(roomImg: "room1", roomTitle: "Main bedroom", roomDesc: "Presidential Deluxe"),
            Room(roomImg: "room2", roomTitle: "Lesehan room", roomDesc: "kamarnya bikin sakit pinggang"),
            Room(roomImg: "room3", roomTitle: "Gelar tiker room", roomDesc: "Kasur pake tiker"),
            Room(roomImg: "room4", roomTitle: "Platinum Room", roomDesc: "Nyaman bangetttttt"),
            
            ])

        let data3 = HotelModel(image: "hotel3", name: "Sheraton Hotel", address: "Street 12321", price: 330, rating: 4.5, desc: "Our hotel offers a unique blend of modern amenities and classic charm, ensuring that each and every guest enjoys an unforgettable stay. With beautifully appointed rooms, all featuring plush bedding, luxurious linens, and state-of-the-art technology, you'll feel right at home from the moment you arrive. Whether you're here for business or pleasure, our friendly and attentive staff is always on hand to ensure that your needs are met. And when it's time to unwind, head to our on-site restaurant and lounge, where you can savor delicious cuisine and signature cocktails. We also offer a range of meeting and event spaces, making us the ideal choice for everything from intimate gatherings to large-scale conferences.", room: [
            Room(roomImg: "room1", roomTitle: "Main bedroom", roomDesc: "Presidential Deluxe"),
            Room(roomImg: "room2", roomTitle: "Lesehan room", roomDesc: "kamarnya bikin sakit pinggang"),
            Room(roomImg: "room3", roomTitle: "Gelar tiker room", roomDesc: "Kasur pake tiker"),
            Room(roomImg: "room4", roomTitle: "Platinum Room", roomDesc: "Nyaman bangetttttt"),
            
            ])

        let data4 = HotelModel(image: "hotel3", name: "Hotel hotelan", address: "Street 12321", price: 30, rating: 4.1, desc: "Our hotel offers a unique blend of modern amenities and classic charm, ensuring that each and every guest enjoys an unforgettable stay. With beautifully appointed rooms, all featuring plush bedding, luxurious linens, and state-of-the-art technology, you'll feel right at home from the moment you arrive. Whether you're here for business or pleasure, our friendly and attentive staff is always on hand to ensure that your needs are met. And when it's time to unwind, head to our on-site restaurant and lounge, where you can savor delicious cuisine and signature cocktails. We also offer a range of meeting and event spaces, making us the ideal choice for everything from intimate gatherings to large-scale conferences.", room: [
            Room(roomImg: "room1", roomTitle: "Main bedroom", roomDesc: "Presidential Deluxe"),
            Room(roomImg: "room2", roomTitle: "Lesehan room", roomDesc: "kamarnya bikin sakit pinggang"),
            Room(roomImg: "room3", roomTitle: "Gelar tiker room", roomDesc: "Kasur pake tiker"),
            Room(roomImg: "room4", roomTitle: "Platinum Room", roomDesc: "Nyaman bangetttttt"),
            
            ])
        
        let data5 = HotelModel(image: "hotel3", name: "Oyo The best", address: "Street 129999", price: 398, rating: 5.0, desc: "Our hotel offers a unique blend of modern amenities and classic charm, ensuring that each and every guest enjoys an unforgettable stay. With beautifully appointed rooms, all featuring plush bedding, luxurious linens, and state-of-the-art technology, you'll feel right at home from the moment you arrive. Whether you're here for business or pleasure, our friendly and attentive staff is always on hand to ensure that your needs are met. And when it's time to unwind, head to our on-site restaurant and lounge, where you can savor delicious cuisine and signature cocktails. We also offer a range of meeting and event spaces, making us the ideal choice for everything from intimate gatherings to large-scale conferences.", room: [
            Room(roomImg: "room1", roomTitle: "Main bedroom", roomDesc: "Presidential Deluxe"),
            Room(roomImg: "room2", roomTitle: "Lesehan room", roomDesc: "kamarnya bikin sakit pinggang"),
            Room(roomImg: "room3", roomTitle: "Gelar tiker room", roomDesc: "Kasur pake tiker"),
            Room(roomImg: "room4", roomTitle: "Platinum Room", roomDesc: "Nyaman bangetttttt"),
            
            ])

        hotelData.append(data1)
        hotelData.append(data2)
        hotelData.append(data3)
        hotelData.append(data4)
        hotelData.append(data5)
        
    }
    
    
}
