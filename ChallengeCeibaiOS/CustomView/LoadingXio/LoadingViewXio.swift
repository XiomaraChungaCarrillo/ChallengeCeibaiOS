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
    
    // STORYBOARD
    @IBOutlet var containerView: UIView!
    @IBOutlet var loadingView: UIView!
    @IBOutlet var circleA: UIView!
    @IBOutlet var circleB: UIView!
    @IBOutlet var circleC: UIView!
    @IBOutlet var circleD: UIView!
    @IBOutlet weak var heighLoading: NSLayoutConstraint!
    @IBOutlet weak var widthLoading: NSLayoutConstraint!
    
    
    
    //Inspectable
    @IBInspectable var isHiddenLoading: Bool = true
    
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
        heighLoading.constant = CGFloat(heightNumberLoading)
        widthLoading.constant = CGFloat(widthNumberLoading)
        setUpCircles()
        
        loading = isHiddenLoading
        
        setupLoadingView()
    }
}

//MARK: - SetupLoading
extension LoadingViewXio {
    
    func setUpCircles() {
        
        containerView.isUserInteractionEnabled = false
        circles.forEach { circle in
            circle.layer.cornerRadius = circle.frame.height / 2
            circle.backgroundColor = .clear
            circle.isUserInteractionEnabled = false }}
    
    
    func blurView(completion: @escaping (_ success: Bool) -> ()) {
        
        if !UIAccessibility.isReduceTransparencyEnabled {
            loadingView.addSubview(blurry)
            loadingView.bringSubviewToFront(blurry)
            loadingView.bringSubviewToFront(containerView)
            UIView.animate(withDuration: 0.6) {
                self.blurry.alpha = 0.5
                completion(true) }}}
    
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
