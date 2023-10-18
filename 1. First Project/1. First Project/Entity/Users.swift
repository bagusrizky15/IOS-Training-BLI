//
//  Users.swift
//  1. First Project
//
//  Created by BBPDEV on 18/10/23.
//

import Foundation

struct Users: Decodable {
    let status: String
    let data: [Employees]
    let message: String
    
    enum CodingKeys: String, CodingKey{
        case status = "status"
        case data = "data"
        case message = "message"
    }
}

struct Employees: Decodable {
    let id : Int
    let employee_name: String
    let employee_salary: Int
    let employee_age: Int
    let profile_image: String?
    
    enum CodingKeys: String, CodingKey{
        case id = "id"
        case employee_name = "employee_name"
        case employee_salary = "employee_salary"
        case employee_age = "employee_age"
        case profile_image = "profile_image"
    }
}
