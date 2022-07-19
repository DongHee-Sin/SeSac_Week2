//
//  SegmentedViewController.swift
//  SeSacWeek2
//
//  Created by 신동희 on 2022/07/12.
//

import UIKit


enum MusicType: Int {
    case all
    case korea
    case other
}


class SegmentedViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentControlValueChanged(segmentControl)
    }
    
    @IBAction func segmentControlValueChanged(_ sender: UISegmentedControl) {
        
        if segmentControl.selectedSegmentIndex == MusicType.all.rawValue {
            resultLabel.text = "ALL !!"
        }else if sender.selectedSegmentIndex == MusicType.korea.rawValue {
            resultLabel.text = "KOREA !!"
        }else if sender.selectedSegmentIndex == MusicType.other.rawValue {
            resultLabel.text = "OTHER !!"
        }else {
            resultLabel.text = "ERROR !!"
        }
    }
    
    
}
