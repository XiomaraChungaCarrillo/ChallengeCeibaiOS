//
//  XioButtonView.swift
//  ChallengeCeibaiOS
//
//  Created by Xio iOS on 27/08/22.
//

import UIKit

@IBDesignable
class XioButtonView: UIButton {
    
    weak var insideview:UIView?
    
    @IBInspectable var color: UIColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 0.5)
    @IBInspectable var cornerRadiusButton: CGFloat = 20
    @IBInspectable var text: String = String()
    
    
    //Outlets
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var cardView: CardViewButton!
    

    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    //MARK: Initialize
    private func initialize(){
        insideview = loadViewFromNib()
        setupUI(view: insideview ?? UIView())
    }
    override func awakeFromNib() {
        
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
    override func layoutSubviews() {
        super.layoutSubviews()
        setupTheme()
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
    
    private func setupTheme() {
        self.setTitle("", for: .normal)
        setupIsDefaultButtonColorSecondary()
    }
    
    // MARK: ColorSecondary

    func setupIsDefaultButtonColorSecondary() {
        cardView.backgroundColor = color
        cardView.cornerRadiusCardView = cornerRadiusButton
        cardView.shadowColor = cardView.shadowColor
        cardView.borderWidth = 2
        cardView.borderColor = #colorLiteral(red: 0.9951933026, green: 1, blue: 1, alpha: 1)
        title.text = text
        title.textColor = #colorLiteral(red: 0.9951933026, green: 1, blue: 1, alpha: 1)
        title.isHidden = false
        isUserInteractionEnabled = true
    }
    
}
