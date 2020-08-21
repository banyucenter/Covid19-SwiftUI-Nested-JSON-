//
//  Covid.swift
//  FetchApiJSONOKE
//
//  Created by Ipung Dev Center on 21/08/20.
//  Copyright © 2020 Banyu Center. All rights reserved.
//

import Foundation
import SwiftUI


struct Total : Codable, Identifiable{
    let id = UUID()
    let jumlah_positif: Int
    let jumlah_meninggal: Int
    let jumlah_sembuh: Int
    let jumlah_dirawat: Int
}

struct Update : Codable{
    let total: Total
}

struct CovidResponse : Codable{
    var update : Update
}



