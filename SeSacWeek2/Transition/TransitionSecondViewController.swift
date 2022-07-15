//
//  TransitionSecondViewController.swift
//  SeSacWeek2
//
//  Created by 신동희 on 2022/07/15.
//

import UIKit

class TransitionSecondViewController: UIViewController {

    
    @IBOutlet weak var mottoTextView: UITextView!
    /*
     1. 앱 켜면 데이터를 가져와서 텍스트 뷰에 보여주어야 함.
     2. 바뀐 데이터를 저장해주어야 해요.
     => UserDefault
     */
    
    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("TransitionSecondViewController", #function)
        
        
        if UserDefaults.standard.string(forKey: "nickname") != nil {
            // 데이터 가져오기
            mottoTextView.text = UserDefaults.standard.string(forKey: "nickname")
        }else {
            // 데이터가 없는 경우 사용할 문구
            mottoTextView.text = "고래밥"
        }
        
        countLabel.text = "\(UserDefaults.standard.integer(forKey: "emotionCount"))"
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

    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        UserDefaults.standard.set(mottoTextView.text, forKey: "nickname")
        print("저장되었습니다.!")
    }
    
    
    
    @IBAction func emotionButtonTapped(_ sender: UIButton) {
        // 기존 데이터 값 가져오기
        let count = UserDefaults.standard.integer(forKey: "emotionCount") + 1
        UserDefaults.standard.set("Bool 넣으라는데 문자열 넣어보기", forKey: "someKey")
        // 새로운 값으로 저장
        UserDefaults.standard.set(count, forKey: "emotionCount")
        
        // 새로운 값으로 라벨 업데이트
        countLabel.text = "\(count)"
    }
    
}
