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
    @IBOutlet weak var userPublications: XioButtonView!
    
    @IBOutlet weak var cardView: CardViewButton!
    
     var color: UIColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 0.5)
     var cornerRadiusButton: CGFloat = 20

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardView.backgroundColor = color
        cardView.cornerRadiusCardView = cornerRadiusButton
        cardView.shadowColor = .clear
        cardView.borderWidth = 1
        cardView.borderColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
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
