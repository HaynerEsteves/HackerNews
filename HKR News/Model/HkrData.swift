//
//  HKRNewsData.swift
//  HKR News
//
//  Created by Hayner Esteves on 28/09/23.
//

import Foundation

struct HkrData: Decodable {
    let hits: [Stories]
}

struct Stories: Decodable, Identifiable {
    //In order to use the this structure on the list in the ContentView it has to be identifiable (protocol).
    let objectID: String
    let title: String
    let url: String?
    let points: Int
    var id: String {
        return objectID
    }
    var stringPoints: String {
        return String(points)//to transform Int into String, just initialize a string. IF you use String(format... it will change the Int into a 0. Only good with Doubles
    }
}
