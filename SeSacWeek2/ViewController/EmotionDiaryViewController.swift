//
//  ViewController.swift
//  SeSacWeek2
//
//  Created by 신동희 on 2022/07/11.
//

import UIKit

class EmotionDiaryViewController: UIViewController {

    // MARK: - Propertys
    @IBOutlet var emotionalLabelList: [UILabel]!
    
    @IBOutlet var emotionButtonList: [UIButton]!
    
    var emotionList: [Emotion] = []
    
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    
    // 피드백1 : 보통 데이터 처리는 화면이 완벽하게 사라진 후 또는 나타나는 시점이 끝난 후 처리한다. (피드백 전에는 viewWillDisappear에 작성)
    // 현재 작성된 UserDefaults에 데이터를 저장하는 코드가 경우에 따라 viewDidDisappear에서만 정상적으로 동작하는 케이스가 있다.
    // 나중에 더 많은 데이터를 처리할 때, 이 부분을 꼭 기억해 두었다가 잘 처리하기..!!
    override func viewDidDisappear(_ animated: Bool) {
        // 피드백2 : super 메서드 호출 누락..!!
        // ⭐️⚠️ 생명주기 메서드 재정의할 때, super 메서드 호출하기 !!!!! 이걸 빼먹네;;..ㅠ
        super.viewDidDisappear(animated)
        
        for (key, emotionType) in zip(EmotionType.allCases, emotionList) {
            UserDefaults.standard.set(emotionType.emotionCount, forKey: key.rawValue)
        }
    }
    
    
    // MARK: - Methods
    @IBAction func emotionButtonTapped(_ sender: UIButton) {
        let index = sender.tag
        
        emotionList[index].increasingCount()
        
        emotionalLabelList[index].text = getLabelTextByIndex(index)
    }
    
    
    // 모든 Emotion Count 초기화
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        for index in 0..<emotionList.count {
            emotionList[index].resetCount()
        }
        updateLabelText()
    }
    
    
    func setupUI() {
        emotionalLabelList.forEach({
            $0.adjustsFontSizeToFitWidth = true
            $0.minimumScaleFactor = 0.5
        })
        
        // 열거형 case 리스트를 사용하여 emotion 인스턴스 생성 후, 배열에 저장
        EmotionType.allCases.forEach({
            let emotion = Emotion(title: $0.rawValue, count: UserDefaults.standard.integer(forKey: $0.rawValue))
            emotionList.append(emotion)
        })
        
        addTag(emotionButtonList)
        
        updateLabelText()
    }
    
    
    func addTag(_ list: [UIView]) {
        for (index, view) in list.enumerated() {
            view.tag = index
        }
    }
    
    // 모든 emotion Label Title 업데이트
    func updateLabelText() {
        for (index, label) in emotionalLabelList.enumerated() {
            label.text = getLabelTextByIndex(index)
        }
    }
    
    // index를 매개변수로 받고, 해당 index의 Label에 맞는 문자열 반환
    func getLabelTextByIndex(_ index: Int) -> String {
        return "\(emotionList[index].emotionTitle) \(emotionList[index].emotionCount)"
    }
    
    
    
    
    func showAlertController() {
        // 1. 흰 바탕 : UIAlertController
        let alert = UIAlertController(title: nil, message: "Count 증가시키기", preferredStyle: .alert)
        
        // 2. 버튼 만들기
        let delete = UIAlertAction(title: "삭제하기", style: .destructive, handler: nil)
        let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let share = UIAlertAction(title: "공유하기", style: .default, handler: nil)
        
        // 3. 버튼 추가하기
        alert.addAction(ok)
        alert.addAction(cancel)
        alert.addAction(share)
        alert.addAction(delete)
        
        // 4. 알림 띄우기
        present(alert, animated: true, completion: nil)
    }
    
    
    func example() -> (UIColor, String, String) {
        let color: [UIColor] = [.yellow, .red, .green]
        let image: [String] = ["sesac_slime6", "sesac_slime5", "sesac_slime4"]
        
        return (color.randomElement()!, "고래밥", image.randomElement()!)
    }
}

