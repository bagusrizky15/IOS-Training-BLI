//
//  Profile.swift
//  1. First Project
//
//  Created by BBPDEV on 18/10/23.
//

import Foundation

struct Profile {
    let name: String
    let job: String
    let age: Int
    let bio: String
}

enum ProfileType: String{
    case name
    case job
    case age
    case bio
}


