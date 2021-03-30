//
//  Guide.swift
//  GetGuide
//
//  Created by Владислав Капицын on 30.03.2021.
//

import Foundation

class Data: Codable {
    let data: [Guide]
}

class Guide: Codable {
    var id: Int
    let contact: String
    let rait: Double
    let firstName: String
    let lastName: String
    let avatar: String
    let comment: String
    let place: String
    
    init(id: Int, contact: String, rait: Double, firstName: String, lastName: String, avatar: String, comment: String, place: String) {
        self.id = id
        self.contact = contact
        self.rait = rait
        self.firstName = firstName
        self.lastName = lastName
        self.avatar = avatar
        self.comment = comment
        self.place = place
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case contact
        case place
        case rait
        case comment
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
    
}

class GuideSinglton {
    static let shared = GuideSinglton()
    private init() {}
    
    var guide: Guide? = nil
}
