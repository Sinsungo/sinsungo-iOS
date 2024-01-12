//
//  GetAllFridge.swift
//  sinsungo
//
//  Created by 원동진 on 2024/01/10.
//

import Foundation
struct GetFridgeModel : Decodable{
    let content: [Content]
//    let pageable: Pageable
//    let size, number: Int
//    let sort: Sort
//    let numberOfElements: Int
//    let first, last, empty: Bool
}
struct Content: Codable {
    let id: Int
    let title, createdAt, modifiedAt: String
    let ingredientList: [IngredientList]
}

struct IngredientList: Codable {
    let id: Int
    let name: String
    let quantity: Int
    let unit, createdAt, modifiedAt: String
}


struct Pageable: Codable {
    let pageNumber, pageSize: Int
    let sort: Sort
    let offset: Int
    let unpaged, paged: Bool
}

struct Sort: Codable {
    let empty, unsorted, sorted: Bool
}
