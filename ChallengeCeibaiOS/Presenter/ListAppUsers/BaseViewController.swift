//
//  BaseViewController.swift
//  ChallengeCeibaiOS
//
//  Created by Xio iOS on 27/08/22.
//

import UIKit

// MARK: - SetupLoadingView
class BaseViewController: UIViewController {
    
    private let startLoading = UINib(nibName: LoadingViewXio.viewIdCell, bundle: nil).instantiate(withOwner: BaseViewController.self, options: nil).first as! LoadingViewXio

    func initStarAnimation() {
        finishAnimation()
        self.view.addSubview(startLoading)
        startLoading.delegate?.setConstraints(forView: startLoading, toView: self.view)
        startLoading.delegate?.startAnimation()
    }
    
    func finishAnimation() {
        startLoading.delegate?.finishAnimation()
        startLoading.removeFromSuperview()
    }
}


