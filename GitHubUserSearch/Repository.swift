//
//  Repository.swift
//  GitHubUserSearch
//
//  Created by Consultant on 3/12/20.
//  Copyright © 2020 Consultant. All rights reserved.
//

import Foundation

struct Repository: Decodable, Encodable
{
    let repoName: String?
    
    let repoStars: Int?
    
    let repoForks: Int?
    
    let repoUrl: String?
}
