//
//  User.swift
//  RESTFullApi
//
//  Created by Md Hosne Mobarok on 30/3/22.
//

import Foundation

// MARK: - Welcome
class User: Codable {
    let page, perPage, total, totalPages: Int
    let data: [Datum]
    let support: Support

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data, support
    }

    init(page: Int, perPage: Int, total: Int, totalPages: Int, data: [Datum], support: Support) {
        self.page = page
        self.perPage = perPage
        self.total = total
        self.totalPages = totalPages
        self.data = data
        self.support = support
    }
}

// MARK: - Datum
class Datum: Codable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }

    init(id: Int, email: String, firstName: String, lastName: String, avatar: String) {
        self.id = id
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.avatar = avatar
    }
}

// MARK: - Support
class Support: Codable {
    let url: String
    let text: String

    init(url: String, text: String) {
        self.url = url
        self.text = text
    }
}
