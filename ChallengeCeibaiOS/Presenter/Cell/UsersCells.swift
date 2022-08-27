//
//  UsersCells.swift
//  ChallengeCeibaiOS
//
//  Created by Xio iOS on 26/08/22.
//

import UIKit

class UsersCells: UITableViewCell {
    
    // MARK: - Items User
    @IBOutlet private weak var userName: UILabel!
    @IBOutlet private weak var userCellPhone: UILabel!
    @IBOutlet private weak var userEmail: UILabel!
    
    // MARK: - Item Button
    @IBOutlet weak var userPublications: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        clearItemsUsers()
    }
}

// MARK: - Cells configuration
extension UsersCells {
    
    func setupItemsUserCell(with listUser: UserInventoryModel) {
        
        userName.text = listUser.name
        userEmail.text = listUser.email
        userCellPhone.text = listUser.phone
    }
    
    func clearItemsUsers() {
        userName.text = nil
        userCellPhone.text = nil
        userEmail.text = nil
    }
}
