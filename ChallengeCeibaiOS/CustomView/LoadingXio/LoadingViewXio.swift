//
//  LoadingViewXio.swift
//  ChallengeCeibaiOS
//
//  Created by Xio iOS on 25/08/22.
//

import UIKit

protocol CustomLoadingViewwDelegate: class {
    func startAnimation()
    func finishAnimation()
    func setConstraints(forView view: UIView,toView:UIView)
}


class LoadingViewXio: UIView {
        
    // STORYBOARD
    @IBOutlet var containerView: UIView!
    @IBOutlet var loadingView: UIView!
    @IBOutlet var circleA: UIView!
    @IBOutlet var circleB: UIView!
    @IBOutlet var circleC: UIView!
    @IBOutlet var circleD: UIView!
  
    
    weak var delegate: CustomLoadingViewwDelegate?

    
    //MARK: Loading Properties
    var heightNumberLoading: Int = 250
    var widthNumberLoading: Int = 250
    
    
    lazy var circles: [UIView] = [circleA, circleB, circleC, circleD]
    var circle = 0
    var colors: [UIColor] = [#colorLiteral(red: 0.32390064, green: 0.4138930738, blue: 0.9091263413, alpha: 0.5), #colorLiteral(red: 0.8235835433, green: 0.5749723315, blue: 0, alpha: 0.5), #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 0.5), #colorLiteral(red: 0.09879464656, green: 0.3816201091, blue: 0.2502036691, alpha: 0.5), #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 0.5), #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 0.5), #colorLiteral(red: 1, green: 0.2204911709, blue: 0.2471658289, alpha: 0.5), #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 0.5), #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 0.5), #colorLiteral(red: 1, green: 0.71805197, blue: 1, alpha: 0.5)]
    lazy var random = Int.random(in: 0...colors.count-1)
    var loading = false
    lazy var blurry: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 0
        blurEffectView.frame = loadingView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurEffectView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCircles()
    }
    
    func starAnimation(){
        loading = true
        setupLoadingView()
    }

    func finishAnimation(){
        loading = false
        setupLoadingView()
    }
    
    func setConstraints(forView view: UIView,toView:UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: toView, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: toView, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: view, attribute: .left, relatedBy: .equal, toItem: toView, attribute: .left, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: view, attribute: .right, relatedBy: .equal, toItem: toView, attribute: .right, multiplier: 1, constant: 0).isActive = true
    }
}

//MARK: - SetupLoading
extension LoadingViewXio {
    
    func setUpCircles() {
        
        containerView.isUserInteractionEnabled = false
        circles.forEach { circle in
            circle.layer.cornerRadius = circle.frame.height / 2
            circle.backgroundColor = .clear
            circle.isUserInteractionEnabled = false
        }
    }
    
    
    func blurView(completion: @escaping (_ success: Bool) -> ()) {
        
        if !UIAccessibility.isReduceTransparencyEnabled {
            loadingView.addSubview(blurry)
            loadingView.bringSubviewToFront(blurry)
            loadingView.bringSubviewToFront(containerView)
            loadingView.backgroundColor = #colorLiteral(red: 0.009867615998, green: 0.04416970164, blue: 0.2421548069, alpha: 1).withAlphaComponent(0.4)
            UIView.animate(withDuration: 0.6) {
                self.blurry.alpha = 0.5
                completion(true) }
        }
    }
    
    func nextCircle() {
        
        random = Int.random(in: 0...colors.count-1)
        if circle == circles.count-1 {
            circle = 0
        } else {
            circle += 1 }}
    
    func circlesAnimation() {
        
        circles[circle].backgroundColor = colors[random].withAlphaComponent(0)
        UIView.animate(withDuration: 0.50) {
            self.circles[self.circle].backgroundColor = self.colors[self.random].withAlphaComponent(0.70)
        } completion: { success in
            self.circles[self.circle].backgroundColor = self.colors[self.random].withAlphaComponent(0)
            self.nextCircle()
            if self.loading == true {
                self.circlesAnimation() }}}
    
    func setupLoadingView() {
        
        if loading == true {
            blurView { success in
                self.circlesAnimation() }
        } else {
            if loadingView.contains(blurry) {
                setUpCircles()
                blurry.removeFromSuperview() }
        }
    }
}
