//
//  AnniversaryCalculatorViewController.swift
//  SeSacWeek2
//
//  Created by 신동희 on 2022/07/13.
//

import UIKit

class AnniversaryCalculatorViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet var forShadowViewList: [UIView]!
    
    @IBOutlet var imageList: [UIImageView]!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        // DateFormatter : 알아보기 쉬운 날짜 + 시간대 (yyyy MM dd hh:mm:ss)
        let format = DateFormatter()
        format.dateFormat = "yyyy년 MM월 dd일"
        
        let result = format.string(from: Date())
        
        print(result, Date())    // 2022년 07월 14일 2022-07-14 03:26:20 +0000 (뒤에꺼는 영국표준시 기준으로 표시된거)
        
        let word = "2018년 09월 10일"
        let dateResult = format.date(from: word)
        print(dateResult)        // Optional(2018-09-09 15:00:00 +0000)
    }
    
    
    
    // MARK: - Methods
    func setupUI() {
        imageList.forEach({ settingImage($0) })
        
        forShadowViewList.forEach({ addShadow($0, color: UIColor.black.cgColor, width: 0, height: 0, alpha: 0.3, radius: 10) })
        
        settingDatePicker(datePicker)
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
    
    
    // Date Picker 설정
    func settingDatePicker(_ picker: UIDatePicker) {
        if #available(iOS 14.0, *) {
            picker.preferredDatePickerStyle = .inline
        }
    }
}
