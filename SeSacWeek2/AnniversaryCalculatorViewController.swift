//
//  AnniversaryCalculatorViewController.swift
//  SeSacWeek2
//
//  Created by 신동희 on 2022/07/13.
//

import UIKit

class AnniversaryCalculatorViewController: UIViewController {

    // MARK: - Propertys
    
    
    
    
    // MARK: - Outlet
    @IBOutlet var forShadowViewList: [UIView]!
    
    @IBOutlet var imageList: [UIImageView]!
    
    
    
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    
    
    // MARK: - Methods
    func setupUI() {
        imageList.forEach({ settingImage($0) })
        
        forShadowViewList.forEach({ addShadow($0, color: UIColor.black.cgColor, width: 0, height: 0, alpha: 0.3, radius: 10) })
    }
    
    
    // 이미지 설정
    func settingImage(_ image: UIImageView) {
        image.transform = image.transform.rotated(by: .pi / 2)
        image.layer.cornerRadius = image.frame.height / 8
    }
    
    
    // 그림자 추가
    func addShadow(_ to: UIView, color: CGColor, width: CGFloat, height: CGFloat, alpha: Float, radius: CGFloat) {
        to.layer.shadowColor = color
        to.layer.shadowOpacity = alpha
        to.layer.shadowRadius = radius
        to.layer.shadowOffset = CGSize(width: width, height: height)
        to.layer.shadowPath = nil
    }
}
