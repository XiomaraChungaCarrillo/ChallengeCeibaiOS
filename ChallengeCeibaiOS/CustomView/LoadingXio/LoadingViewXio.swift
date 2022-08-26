//
//  LoadingViewXio.swift
//  ChallengeCeibaiOS
//
//  Created by Xio iOS on 25/08/22.
//

import UIKit

@IBDesignable
class LoadingViewXio: UIView {
    
    weak var insideview: UIView?
    
    //Inspectable
    // STORYBOARD
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var loadingView: UIView!
    @IBOutlet var circleA: UIView!
    @IBOutlet var circleB: UIView!
    @IBOutlet var circleC: UIView!
    @IBOutlet var circleD: UIView!
    
    //MARK: Loading Properties
    
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupTheme()
    }
    
    override func awakeFromNib() {
        
    }
    
}


//MARK: - SetupView
extension LoadingViewXio {
    
    //MARK: Initialize
    private func initialize(){
        insideview = loadViewFromNib()
        setupUI(view: insideview ?? UIView())
    }
    
    //MARK: UI Methods
    private func loadViewFromNib() -> UIView! {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)),
                        bundle: bundle)
        return nib.instantiate( withOwner: self,
                                options: nil).first as? UIView
    }
    
    private func setupUI(view: UIView?){
        insideview?.frame = self.bounds
        addSubview(insideview ?? UIView())
        clearConstraints()
        
    }
    
    
    private func clearConstraints(){
        insideview?.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[childView]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": insideview ?? UIView()]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[childView]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": insideview ?? UIView()]))
    }
}

//MARK: - ShowLoading
extension LoadingViewXio {
    
    private func setupTheme() {

    }
}

//MARK: - SetupLoading
extension LoadingViewXio {
    
    
}
