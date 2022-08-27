//
//  UserPublicationsListViewController.swift
//  ChallengeCeibaiOS
//
//  Created by Xio iOS on 27/08/22.
//

import UIKit

class UserPublicationsListViewController: UIViewController {

    @IBOutlet weak var publicationsTableView: UITableView!
    
    var usersPublications: [PublicationUserModel]?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Publicationes desumptae User"
        tableViewConfiguration()
    }
}

// MARK: - Upload Users Publications List
extension UserPublicationsListViewController {
    
    func tableViewConfiguration() {
        publicationsTableView.register(UINib(nibName: UserPublicationCells.viewIdCell, bundle: .main), forCellReuseIdentifier: UserPublicationCells.viewIdCell)
    }
}

// MARK: - Upload Users List
extension UserPublicationsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersPublications?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserPublicationCells.viewIdCell, for: indexPath)
        cell.selectionStyle = .none

        if let cell = cell as? UserPublicationCells , let arrayPublications = usersPublications {
            cell.organizeCell(with: arrayPublications[indexPath.row])
        }

        return cell
    }
}
