//
//  UserTests.swift
//  App
//
//  Created by 彭军涛 on 2019/4/19.
//

//@testable import App
//import Vapor
//import XCTest
//import FluentPostgreSQL
//
//final class UserTests: XCTestCase {
//    func textUsersCanBeRetrievedFromAPI() throws {
//        let expectedName = "Alice"
//        let expectedUsername = "alice"
//
//        var config = Config.default()
//        var services = Services.default()
//        var env = Environment.testing
//        try App.configure(&config, &env, &services)
//
//        let app = try Application(config: config, environment: env, services: services)
//        try App.boot(app)
//
//        let conn = try app.newConnection(to: .psql).wait()
//
//        let user = User(name: expectedName, userName: expectedUsername)
//        let savedUser = try user.save(on: conn).wait()
//        _ = try User(name: "Luke", userName: "lukes").save(on: conn).wait()
//
//        let responder = try app.make(Response.self)
//
//        let request = HTTPRequest(method: .GET, url: URL(string: "/api.users")!)
//        let wrappedRequest = Request(http: request, using: app)
//
//        let response = try responder.re
//
//
//    }
//}
