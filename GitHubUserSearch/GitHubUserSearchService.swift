//
//  GitHubUserSearchService.swift
//  GitHubUserSearch
//
//  Created by Consultant on 3/12/20.
//  Copyright © 2020 Consultant. All rights reserved.
//

import Foundation

final class GitHubUserSearchService: APIClientDecodable
{
    func getUsers(_ parameter: String, completion: @escaping CompletionHandler)
    {
        guard let url = GithubAPI(parameter).searchUrl else {
            let errorInfo = ErrorInfo(errorCode: .badUrl, errorDescription: "URL Creation Failed", statusCode: 0)
            completion(.failure(errorInfo))
            return
            
        }
        print(url)
        URLSession.shared.dataTask(with: url){dat, _, err in
            if let error = err{
                let errorInfo = ErrorInfo(errorCode: .badRequest, errorDescription: error.localizedDescription, statusCode: 0)
                completion(.failure(errorInfo))
                return
            }
            
            if let data = dat{
           
                    if let serializedObject = self.decodeServiceResults(UserResults.self, result: data)
                    {
                        completion(.success(serializedObject))
                    }
                    
                
                    let errorInfo = ErrorInfo(errorCode: .parsingFailed, errorDescription: "Data parsing failed", statusCode: 0)
                    completion(.failure(errorInfo))
                
                
            }
        }.resume()
    }
}
