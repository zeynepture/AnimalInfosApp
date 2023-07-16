//
//  BoxView.swift
//  AnimalInfos
//
//  Created by Zeynep on 16.07.2023.
//


import UIKit

class BoxView: UIView {
    
    var webLink: String?
    var videoPath: String?
    var gotoLinkAction: ((_ urlString: String) -> ())?
    var gotoVideoAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        if let viewForXib = Bundle.main.loadNibNamed("BoxView", owner: self)?[0] as? UIView {
            viewForXib.frame = self.bounds
            viewForXib.layer.cornerRadius = 20
            addSubview(viewForXib)
        }
    }
    @IBAction func gotoLinkAct(_ sender: Any) {
        gotoLinkAction?(webLink!)
    }
    
  
    @IBAction func watchVideoAct(_ sender: Any) {
        gotoVideoAction?()
    }
    

}
