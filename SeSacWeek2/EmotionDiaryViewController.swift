//
//  ViewController.swift
//  SeSacWeek2
//
//  Created by 신동희 on 2022/07/11.
//

import UIKit

class EmotionDiaryViewController: UIViewController {

    // MARK: - Propertys
    @IBOutlet var emotionalLabels: [UILabel]!
    
    
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emotionalLabels.forEach({
            $0.adjustsFontSizeToFitWidth = true
            $0.minimumScaleFactor = 0.5
        })
    }


    // MARK: - Methods
    @IBAction func emotionButtonTapped(_ sender: UIButton) {
        let index = sender.tag
        
        guard let temp = emotionalLabels[index].text?.split(separator: " ").map({String($0)}) else { return }
        
        guard let count = Int(temp[1]) else { return }
        
        print("\(temp[0]) 눌림")
        
        showAlertController()
        
        emotionalLabels[index].text = "\(temp[0]) \(String(count + 1))"
    }
    
    
    func showAlertController() {
        // 1. 흰 바탕 : UIAlertController
        let alert = UIAlertController(title: "타이틀", message: "여기는 메시지가 들어갑니다", preferredStyle: .alert)
        
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

