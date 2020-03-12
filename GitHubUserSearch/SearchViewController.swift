//
//  ViewController.swift
//  GitHubUserSearch
//
//  Created by Consultant on 3/11/20.
//  Copyright © 2020 Consultant. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var userTableView: UITableView!
    
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
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
    }


}

extension SearchViewController: UISearchBarDelegate, UISearchResultsUpdating
{
    func updateSearchResults(for searchController: UISearchController) {
        guard let search = searchController.searchBar.text else {return}
        guard let sanitized = search.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        
        //grab the users
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as! UserTableViewCell
        
        
        return cell
    }
    
    
}
