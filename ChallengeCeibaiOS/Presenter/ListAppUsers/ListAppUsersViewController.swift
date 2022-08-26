//
//  ListAppUsersViewController.swift
//  ChallengeCeibaiOS
//
//  Created by Xio iOS on 26/08/22.
//

import UIKit

class ListAppUsersViewController: UIViewController {

    
    private let startLoading = UINib(nibName: "LoadingViewXio", bundle: nil).instantiate(withOwner: self, options: nil).first as! LoadingViewXio
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAnimation()
     }
    
    func setupAnimation() {
        finishAnimation()
        self.view.addSubview(startLoading)
        startLoading.setConstraints(forView: startLoading, toView: self.view)
        startLoading.starAnimation()
    }
    
    func finishAnimation() {
        startLoading.finishAnimation()
        startLoading.removeFromSuperview()
    }

}
