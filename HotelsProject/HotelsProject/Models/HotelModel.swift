//
//  HotelModel.swift
//  HotelsProject
//
//  Created by Adlan Nourindiaz on 02/03/23.
//

import Foundation

struct HotelModel {
    
    let image: String
    let name: String
    let address: String
    let price: Int
    let rating: Float
    let desc: String
    let room: [Room]
}
