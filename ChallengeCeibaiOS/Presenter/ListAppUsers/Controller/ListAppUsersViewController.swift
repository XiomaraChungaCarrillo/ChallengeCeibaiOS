//
//  ListAppUsersViewController.swift
//  ChallengeCeibaiOS
//
//  Created by Xio iOS on 26/08/22.
//

import UIKit

class ListAppUsersViewController: BaseViewController {
    
    private let ceibaService =  ListAppUsersService()
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
            cell.userPublications.addTarget(.none, action: #selector(self.showPublicationsButton(_:)), for: .touchUpInside)
            cell.userPublications.tag = listUsersArray[indexPath.row].id ?? Int()
        }

        return cell
    }
}

// MARK: - Service Request
extension ListAppUsersViewController {
    
    func loadListUsers() {
        
        initStarAnimation()
        ceibaService.loadingUsersList { [weak self] decodedUsersData in
            guard let self = self else { return }
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
                self.finishAnimation()
                self.listUser = decodedUsersData
                self.reloadData()
            }
        }
    }
    
    
}

// MARK: - Configurating Action Button
extension ListAppUsersViewController {
    
    @objc func showPublicationsButton(_ positionID: UIButton){
        uploadUserPublications(positionID.tag)
    }
    
    func uploadUserPublications(_ userID: Int) {
        initStarAnimation()
        ceibaService.loadingUserPublications(userID) { [weak self] decodedPublicationsData in
            guard let self = self else { return }
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
                self.goToUserPublicationsController(decodedPublicationsData)
                self.finishAnimation()
            }
        }
    }
    
    func goToUserPublicationsController(_ publicationsUser: [PublicationUserModel]) {
        let ScreenView = UIStoryboard(name: "Main", bundle: nil)
        guard let validationUserViewController = ScreenView.instantiateViewController(withIdentifier: "UserPublicationsListViewController") as? UserPublicationsListViewController else { return  }
        validationUserViewController.hidesBottomBarWhenPushed = true
        validationUserViewController.usersPublications = publicationsUser
        self.navigationController?.pushViewController(validationUserViewController, animated: true)
    }
}