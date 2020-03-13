//
//  User.swift
//  GitHubUserSearch
//
//  Created by Consultant on 3/12/20.
//  Copyright © 2020 Consultant. All rights reserved.
//

import Foundation

struct UserResults: Decodable, Encodable
{
    let results: [User]
    
    private enum CodingKeys: String, CodingKey
    {
        case results = "items"
    }
}

struct User: Decodable, Encodable
{
    let userName: String?
    
    let avatarImage: String?
    
    let repoCount: Int?
    
    let followerCount: Int?
    
    let followingCount: Int?
    
    let bio: String?
    
    let email: String?
    
    let location: String?
    
    let joinDate: String?
    
    let publicRepos: [Repository]?
    
}
