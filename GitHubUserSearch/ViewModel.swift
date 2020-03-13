//
//  ViewModel.swift
//  GitHubUserSearch
//
//  Created by Consultant on 3/11/20.
//  Copyright © 2020 Consultant. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ViewModel
{
    
    let users: BehaviorRelay<[User]> = BehaviorRelay(value: [])

}

extension ViewModel
{
    func getUsers(_ name: String)
    {
        GitHubUserSearchService().getUsers(name) { [weak self] result in
            switch result
            {
            case .success(let users):
                if let u = users as? [User]
                {
                    self?.users.accept(u)
                    print("User Count: \(u.count)")

                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
