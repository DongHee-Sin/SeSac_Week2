//
//  AnniversaryCalculatorViewController.swift
//  SeSacWeek2
//
//  Created by 신동희 on 2022/07/13.
//

import UIKit

// UserDefaults Key
enum AnniversaryKey: String {
    case anniversary
}

class AnniversaryCalculatorViewController: UIViewController {

    // MARK: - Propertys
    let dateFormatter = DateFormatter()
    
    // DatePicker의 Date값을 문자열로 get-set하는 연산 프로퍼티 연습
    var currentSelectedDateString: String {
        get {
            return dateFormatter.string(from: datePicker.date)
        }
        set {
            if let date = dateFormatter.date(from: newValue) {
                datePicker.date = date
            }
        }
    }
    
    
    var after100Date: Date {
        get {
            if let date = dateFormatter.date(from: after100DateLabel.text!) {
                return date
            }else {
                return Date()
            }
        }
        set {
            // 입력된 Date를 문자열로 변환하여 Label.text 업데이트
            after100DateLabel.text = dateFormatter.string(from: newValue)
        }
    }
    
    var after200Date: Date {
        get {
            if let date = dateFormatter.date(from: after200DateLabel.text!) {
                return date
            }else {
                return Date()
            }
        }
        set {
            // 입력된 Date를 문자열로 변환하여 Label.text 업데이트
            after200DateLabel.text = dateFormatter.string(from: newValue)
        }
    }
    
    
    
    // MARK: - Outlet
    @IBOutlet var forShadowViewList: [UIView]!
    
    @IBOutlet var imageList: [UIImageView]!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // 현재 선택된 날짜 기준으로 +100, 200, 300, 400을 보여주는 Label
    @IBOutlet weak var after100DateLabel: UILabel!
    @IBOutlet weak var after200DateLabel: UILabel!
    @IBOutlet weak var after300DateLabel: UILabel!
    @IBOutlet weak var after400DateLabel: UILabel!
    
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    
    // 화면이 내려갈 때, 현재 선택된 Date값 저장
    override func viewWillDisappear(_ animated: Bool) {
        let dateString = dateToString(datePicker.date)
        UserDefaults.standard.set(dateString, forKey: AnniversaryKey.anniversary.rawValue)
        print("")
    }
    
    
    
    // MARK: - Methods
    func setupUI() {
        [after100DateLabel, after200DateLabel, after300DateLabel, after400DateLabel].forEach({ settingLabel($0) })
        
        imageList.forEach({ settingImage($0) })
        
        forShadowViewList.forEach({ addShadow($0, color: UIColor.black.cgColor, width: 0, height: 0, alpha: 0.3, radius: 10) })
        
        settingDatePicker(datePicker)
        
        dateFormatter.dateFormat = "yyyy년\nMM월 dd일"
        
        datePickerValueChanged(datePicker)
        
        // 1. 저장된 Day값 가져오기
        // 2. Date Picker값 변경하기
        // 3. 라벨 돌면서 100일씩 더해준 값 입력하기
        if let dateString = UserDefaults.standard.string(forKey: AnniversaryKey.anniversary.rawValue), let date = stringToDate(dateString) {
            datePicker.date = date
            updateAnniversaryLabel(by: date)
        }
        
    }
    
    
    // Label UI 설정
    func settingLabel(_ label: UILabel) {
        label.textAlignment = .center
        label.numberOfLines = 2
        label.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
    }
    
    
    // 이미지 UI 설정
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
    
    
    // iOS버전 대응하여 Date Picker 설정
    func settingDatePicker(_ picker: UIDatePicker) {
        if #available(iOS 14.0, *) {
            picker.preferredDatePickerStyle = .inline
            picker.datePickerMode = .date
        }
    }
    
    
    func printToday() {
        // DateFormatter : 알아보기 쉬운 날짜 + 시간대 (yyyy MM dd hh:mm:ss)
        let format = DateFormatter()
        format.dateFormat = "yyyy년 MM월 dd일"          // format 형식 지정
        
        let result = format.string(from: Date())      // Date To String 변환
        
        print(result, Date())    // 2022년 07월 14일
        print(Date())            // 2022-07-14 03:26:20 +0000 (뒤에꺼는 영국표준시 기준으로 표시된거)
        
        
        let word = "2018년 09월 10일"
        let dateResult = format.date(from: word)      // String To Date (format형식에 맞지 않는 문자열을 입력하면 실패하기 때문에 OptionalType으로 반환)
        
        print(dateResult ?? "")        // Optional(2018-09-09 15:00:00 +0000)
    }
    
    
    // Date -> String 타입 변환
    func dateToString(_ date: Date) -> String {
        return dateFormatter.string(from: date)
    }
    
    
    // String -> Date 타입 변환
    func stringToDate(_ string: String) -> Date? {
        return dateFormatter.date(from: string)
    }
    
    
    // 매개변수로 입력된 Date값 기준 100일 추가하여 반환
    func addDay(_ date: Date, additional: TimeInterval) -> Date {
        return date.addingTimeInterval(60 * 60 * 24 * additional)
    }
    
    
    // 매개변수로 입력된 Date값 기준으로 기념일 Label 업데이트 (+100, 200, 300, 400)
    func updateAnniversaryLabel(by date: Date) {
        after100Date = addDay(date, additional: 100)
        after200Date = addDay(date, additional: 200)
        
        after300DateLabel.text = dateToString(addDay(date, additional: 300))
        after400DateLabel.text = dateToString(addDay(date, additional: 400))
    }
    
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        updateAnniversaryLabel(by: sender.date)
    }
}
