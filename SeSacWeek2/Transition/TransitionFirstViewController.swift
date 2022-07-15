//
//  TransitionFirstViewController.swift
//  SeSacWeek2
//
//  Created by 신동희 on 2022/07/15.
//

import UIKit

class TransitionFirstViewController: UIViewController {

    
    @IBOutlet weak var randomLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
        
        randomLabel.text = "\(Int.random(in: 1...100))"
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function)
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }
    
    
    
    
    // 1. UIStoryboardSegue -> 내부적으로 뷰 계층구조를 파악해서 화면을 되돌려준다.
    @IBAction func unwindTransitionFirstVC(dongSegue: UIStoryboardSegue) {
    }
    
}
