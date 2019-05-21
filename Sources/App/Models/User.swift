import Foundation
import Vapor
import FluentPostgreSQL

final class User: Codable{
    var id: UUID?
    var name: String
    var userName:String
    var password: String
    
    init(name: String,userName: String,password:String) {
        self.name = name
        self.userName = userName
        self.password = password
    }
}

extension User: PostgreSQLUUIDModel {}
extension User: Content {}
extension User: Migration {
    static func prepare(on connection: PostgreSQLConnection) -> Future<Void> {
        return Database.create(self, on: connection){
            builder in
            try addProperties(to: builder)
            builder.unique(on: \.userName)
        }
    }
}
extension User: Parameter {}

extension User {
    //User的儿子是Acronym
    var acronyms: Children<User,Acronym> {
        return children(\.userID)
    }
}
