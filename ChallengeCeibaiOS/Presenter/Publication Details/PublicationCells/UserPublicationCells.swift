//
//  UserPublicationCells.swift
//  ChallengeCeibaiOS
//
//  Created by Xio iOS on 27/08/22.
//

import UIKit

 class UserPublicationCells: UITableViewCell {
    
    // MARK: - Items User Publications List
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet private weak var titleOfPublication: UILabel!
    @IBOutlet private weak var descriptionOfPublication: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
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
        userImage.layer.cornerRadius = userImage.frame.size.height/2
    }
    
    func clearPublicationsUsers() {
        titleOfPublication.text = nil
        descriptionOfPublication.text = nil
    }
}
