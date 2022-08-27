//
//  BaseViewController.swift
//  ChallengeCeibaiOS
//
//  Created by Xio iOS on 27/08/22.
//

import UIKit

// MARK: - SetupLoadingView
class BaseViewController: UIViewController {
    
    private let startLoading = UINib(nibName: LoadingViewXio.viewIdCell, bundle: nil).instantiate(withOwner: self, options: nil).first as! LoadingViewXio

    func initStarAnimation() {
        finishAnimation()
        self.view.addSubview(startLoading)
        setConstraints(forView: startLoading, toView: self.view)
        startLoading.delegate?.startAnimation()
    }
    
    func finishAnimation() {
        startLoading.delegate?.finishAnimation()
        startLoading.removeFromSuperview()
    }
    
    func setConstraints(forView view: UIView,toView:UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: toView, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: toView, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: view, attribute: .left, relatedBy: .equal, toItem: toView, attribute: .left, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: view, attribute: .right, relatedBy: .equal, toItem: toView, attribute: .right, multiplier: 1, constant: 0).isActive = true
    }
}


