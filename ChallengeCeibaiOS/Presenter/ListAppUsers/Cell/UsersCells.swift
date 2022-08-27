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
    
     var color: UIColor = #colorLiteral(red: 0.0397044532, green: 0.01789819822, blue: 0.1158874109, alpha: 1)
     var cornerRadiusButton: CGFloat = 20

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardView.backgroundColor = color
        cardView.cornerRadiusCardView = cornerRadiusButton
        cardView.shadowColor = cardView.shadowColor
        cardView.borderWidth = 2
        cardView.borderColor = #colorLiteral(red: 0.9951933026, green: 1, blue: 1, alpha: 1)
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
