//
//  ViewController.swift
//  ChallengeCeibaiOS
//
//  Created by Xio iOS on 25/08/22.
//

import UIKit
 
class ViewController: UIViewController {
    
    
 
    @IBOutlet weak var viewTest: UIView!
    
    private let startLoading = UINib(nibName: "LoadingViewXio", bundle: nil).instantiate(withOwner: self, options: nil).first as! LoadingViewXio
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimation()
     }
    
    func startAnimation() {
        finishAnimation()
        self.view.addSubview(startLoading)
        setConstraints(forView: startLoading, toView: self.view)
        startLoading.starAnimation()
    }
    
    func finishAnimation() {
        startLoading.finishAnimation()
        startLoading.removeFromSuperview()
    }

    private func setConstraints(forView view: UIView,toView:UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: toView, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: toView, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: view, attribute: .left, relatedBy: .equal, toItem: toView, attribute: .left, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: view, attribute: .right, relatedBy: .equal, toItem: toView, attribute: .right, multiplier: 1, constant: 0).isActive = true
    }

}

