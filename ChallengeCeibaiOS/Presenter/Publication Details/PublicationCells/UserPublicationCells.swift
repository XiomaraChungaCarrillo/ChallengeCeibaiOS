//
//  UserPublicationCells.swift
//  ChallengeCeibaiOS
//
//  Created by Xio iOS on 27/08/22.
//

import UIKit

 class UserPublicationCells: UITableViewCell {
    
    // MARK: - Items User Publications List
    @IBOutlet private weak var titleOfPublication: UILabel!
    @IBOutlet private weak var descriptionOfPublication: UILabel!
     
     @IBOutlet weak var cardView: CardViewButton!
    
     var color: UIColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 0.447603079)
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
        clearPublicationsUsers()
    }
}

// MARK: - Cells Configuration
extension UserPublicationCells {
    
    func organizeCell(with postsList: PublicationUserModel) {
        
        titleOfPublication.text = "Titulus: \(postsList.title ?? String())"
        descriptionOfPublication.text = "Descriptio: \(postsList.title ?? String())"
    }
    
    func clearPublicationsUsers() {
        titleOfPublication.text = nil
        descriptionOfPublication.text = nil
    }
}
