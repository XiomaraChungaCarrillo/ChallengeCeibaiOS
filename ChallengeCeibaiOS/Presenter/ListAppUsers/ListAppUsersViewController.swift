//
//  ListAppUsersViewController.swift
//  ChallengeCeibaiOS
//
//  Created by Xio iOS on 26/08/22.
//

import UIKit

class ListAppUsersViewController: BaseViewController {
    
    private let service =  ListAppUsersService()
    private var listUser: [UserInventoryModel]?
    
    @IBOutlet weak var tableViewListUser: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTablewView()
        getDataUser()
     }
    
}

// MARK: - Getting User Data
extension ListAppUsersViewController {
    
    func getDataUser() {
        loadListUsers()
        reloadData()
    }
}

// MARK: - ConfigTableView
extension ListAppUsersViewController {
    
    func reloadData() {
        tableViewListUser.reloadData()
    }
    
    func setupTablewView() {
        tableViewListUser.register(UINib(nibName: UsersCells.viewIdCell, bundle: .main), forCellReuseIdentifier: UsersCells.viewIdCell)
    }
    
}

// MARK: - SetupDataSource
extension ListAppUsersViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listUser?.count ?? Int()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: UsersCells.viewIdCell, for: indexPath)
        
        cell.selectionStyle = .none

        if let cell = cell as? UsersCells , let listUsersArray = listUser {
            cell.setupItemsUserCell(with: listUsersArray[indexPath.row])
        }

        return cell
    }
}

// MARK: - Service Request
extension ListAppUsersViewController {
    
    func loadListUsers() {
        initStarAnimation()
        service.loadingUsersList { [weak self] responseData in
            guard let self = self else { return }
            self.listUser = responseData
            self.reloadData()
            self.finishAnimation()
        }
    }
}
