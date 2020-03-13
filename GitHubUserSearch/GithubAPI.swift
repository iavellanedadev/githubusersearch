//
//  GithubAPI.swift
//  GitHubUserSearch
//
//  Created by Consultant on 3/11/20.
//  Copyright © 2020 Consultant. All rights reserved.
//

import Foundation

class GithubAPI
{
    let base = "https://api.github.com/search/"
    
    let userSearch = "users?q="
    
    var searchParameter: String?
    
    init(_ parameter: String)
    {
        self.searchParameter = parameter
    }
    
    var searchUrl: URL?{
        guard let lookupParam = searchParameter else {return nil}
        return URL(string: base + userSearch + lookupParam)
    }
}
