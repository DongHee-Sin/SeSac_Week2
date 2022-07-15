//
//  TransitionSecondViewController.swift
//  SeSacWeek2
//
//  Created by 신동희 on 2022/07/15.
//

import UIKit

enum UserDefaultsKey: String {
    case nickname
    case emotionCount
}

class TransitionSecondViewController: UIViewController {

    /*
     1. 앱 켜면 데이터를 가져와서 텍스트 뷰에 보여주어야 함.
     2. 바뀐 데이터를 저장해주어야 해요.
     => UserDefault
     */
    
    // MARK: - Outlets
    @IBOutlet weak var mottoTextView: UITextView!
    
    @IBOutlet weak var countLabel: UILabel!
    
    
    
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        print("TransitionSecondViewController", #function)
        
        
        if UserDefaults.standard.string(forKey: UserDefaultsKey.nickname.rawValue) != nil {
            // 데이터 가져오기
            mottoTextView.text = UserDefaults.standard.string(forKey: UserDefaultsKey.nickname.rawValue)
        }else {
            // 데이터가 없는 경우 사용할 문구
            mottoTextView.text = "고래밥"
        }
        
        countLabel.text = "\(UserDefaults.standard.integer(forKey: UserDefaultsKey.emotionCount.rawValue))"
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("TransitionSecondViewController", #function)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("TransitionSecondViewController", #function)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("TransitionSecondViewController", #function)
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("TransitionSecondViewController", #function)
    }

    
    
    
    // MARK: - Methods
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        UserDefaults.standard.set(mottoTextView.text, forKey: UserDefaultsKey.nickname.rawValue)
    }
    
    
    
    @IBAction func emotionButtonTapped(_ sender: UIButton) {
        // 기존 데이터 값 가져오기
        let count = UserDefaults.standard.integer(forKey: UserDefaultsKey.emotionCount.rawValue) + 1

        // 새로운 값으로 저장
        UserDefaults.standard.set(count, forKey: UserDefaultsKey.emotionCount.rawValue)

        // 새로운 값으로 라벨 업데이트
        countLabel.text = "\(count)"
    }
    
}
