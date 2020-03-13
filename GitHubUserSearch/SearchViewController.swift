//
//  ViewController.swift
//  GitHubUserSearch
//
//  Created by Consultant on 3/11/20.
//  Copyright © 2020 Consultant. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SearchViewController: UIViewController {
    @IBOutlet weak var userTableView: UITableView!
    
    let disposeBag = DisposeBag()
    
    let vm = ViewModel()
    
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userTableView.delegate = self
        userTableView.dataSource = self
        
        setupSearch()
    }
    
    private func setupSearch()
    {
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        print("search bar setup")
    }

}

extension SearchViewController: UISearchBarDelegate, UISearchResultsUpdating
{
    func updateSearchResults(for searchController: UISearchController) {
        guard let search = searchController.searchBar.text, let sanitized = search.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        
        //grab the users
        vm.getUsers(sanitized)
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.users.value.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as! UserTableViewCell
        
        let user = vm.users.value[indexPath.row]
        
        cell.userNameLabel.text = user.userName
        
        return cell
    }
    
    
}
