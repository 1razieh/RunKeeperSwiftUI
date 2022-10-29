//
//  Medal.swift
//  RunKeeperSwiftUI
//
//  Created by Razieh Halimi on 2022-10-22.
//

import Foundation
struct MedalData:Decodable {
    var medals: [Medal]
}

struct Medal:Decodable, Identifiable {
    var id: Int
    var title: String
    var image: String
    var recordTime: String
    var categoryType: String
}
