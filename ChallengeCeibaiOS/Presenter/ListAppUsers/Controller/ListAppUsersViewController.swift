//
//  ListAppUsersViewController.swift
//  ChallengeCeibaiOS
//
//  Created by Xio iOS on 26/08/22.
//

import UIKit

class ListAppUsersViewController: BaseViewController {
    
    private let ceibaService =  ListAppUsersService()
    private var dataListUsers: [UserInventoryModel]?
    private var dataFilterUserNameList: [UserInventoryModel]?

    @IBOutlet weak var tableViewListUser: UITableView!
    @IBOutlet weak var searchBarInList: UISearchBar!
    @IBOutlet weak var emptyListString: UILabel!
    
    private var statusValue = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
     }
}

// MARK: - ConfigTableView
extension ListAppUsersViewController {
    
    func setupView() {
        setupTablewView()
        searchBarConfiguration()
        getDataUser()
    }
    
    func reloadData() {
        tableViewListUser.reloadData()
    }
    
    func setupTablewView() {
        tableViewListUser.register(UINib(nibName: UsersCells.viewIdCell, bundle: .main), forCellReuseIdentifier: UsersCells.viewIdCell)
        tableViewListUser.separatorInset = .zero
        tableViewListUser.separatorColor = .clear
    }
    
}

// MARK: - Getting User Data
extension ListAppUsersViewController {
    
    func getDataUser() {
        loadListUsers()
        reloadData()
    }
}

// -MARK: - SearchBarDelegate
extension ListAppUsersViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if (searchText == String()) {
            reloadData()
            emptyListString.isHidden = true
        } else {
            let resultListUsersFilter =  dataListUsers?.filter {
                usersSearchSuccess(statusValue: statusValue, searchText: searchText, nameUser: $0.name ?? String())
            }
            dataListUsers = resultListUsersFilter
            emptyListString.isHidden = dataListUsers?.count ?? 0 > 0 ? true : false
            reloadData()
        }
    }
    
    func usersSearchSuccess(statusValue: Bool, searchText: String, nameUser: String) -> Bool{
        
        var resultValue = statusValue
        
        if let range: Range<String.Index> = nameUser.range(of: "\(searchText)") {
            print(range)
            resultValue = true
        } else {
            resultValue = false
            refreshData()
        }
        return resultValue
    }
    
    
    func searchBarConfiguration() {
        searchBarInList.delegate = self
        searchBarInList.placeholder = "Search Name User"
        emptyListString.isHidden = true
    }
}

// MARK: - SetupDataSource
extension ListAppUsersViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataListUsers?.count ?? Int()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: UsersCells.viewIdCell, for: indexPath)
        
        if let cell = cell as? UsersCells , let listUsersArray = dataListUsers {
            cell.setupItemsUserCell(with: listUsersArray[indexPath.row])
            cell.userPublications.addTarget(.none, action: #selector(self.showPublicationsButton(_:)), for: .touchUpInside)
            cell.userPublications.tag = listUsersArray[indexPath.row].id ?? Int()
        }
        cell.selectionStyle = .none
        return cell
    }
}

// MARK: - Service Request
extension ListAppUsersViewController {
    
    func refreshData() {
        ceibaService.loadingUsersList { [weak self] decodedUsersData in
            guard let self = self else { return }
                self.dataListUsers = decodedUsersData
                self.dataFilterUserNameList = decodedUsersData
        }
    }
    
    func loadListUsers() {
        initStarAnimation()
        ceibaService.loadingUsersList { [weak self] decodedUsersData in
            guard let self = self else { return }
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
                self.finishAnimation()
                self.dataListUsers = decodedUsersData
                self.dataFilterUserNameList = decodedUsersData
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
