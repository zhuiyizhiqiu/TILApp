//
//  AcronymCategoryPivot.swift
//  App
//
//  Created by 彭军涛 on 2019/4/18.
//

import Foundation
import FluentPostgreSQL

final class AcronymCategoryPivot: PostgreSQLUUIDPivot{
    var id: UUID?
    var acronymID: Acronym.ID
    var categoryID: Category.ID
    
    typealias Left = Acronym
    typealias Right = Category
    
    static let leftIDKey: LeftIDKey = \.acronymID
    static let rightIDKey: RightIDKey = \.categoryID
    
    init(_ acronym: Acronym,_ category: Category) throws {
        self.acronymID = try acronym.requireID()
        self.categoryID = try category.requireID()
    }
}

extension AcronymCategoryPivot: Migration {
    static func prepare( on connection: PostgreSQLConnection) -> Future<Void> {
        return Database.create(self, on: connection){
            builder in
            try addProperties(to: builder)
            builder.reference(from: \.acronymID, to: \Acronym.id, onDelete: .cascade)
            builder.reference(from: \.categoryID, to: \Category.id, onDelete: .cascade)
        }
    }
}
extension AcronymCategoryPivot: ModifiablePivot {}
