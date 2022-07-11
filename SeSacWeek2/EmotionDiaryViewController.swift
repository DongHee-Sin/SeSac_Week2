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
        guard let index = Int(sender.currentTitle ?? "") else { return }
        
        guard let temp = emotionalLabels[index].text?.split(separator: " ").map({String($0)}) else { return }
        
        guard let count = Int(temp[1]) else { return }
        
        print("\(temp[0]) 눌림")
        
        emotionalLabels[index].text = "\(temp[0]) \(String(count + 1))"
    }
}

