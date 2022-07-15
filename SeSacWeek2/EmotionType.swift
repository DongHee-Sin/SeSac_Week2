//
//  EmotionType.swift
//  SeSacWeek2
//
//  Created by 신동희 on 2022/07/12.
//

import Foundation

enum EmotionType: String, CaseIterable {
    case happy = "행복해"
    case love = "사랑해"
    case like = "좋아해"
    case angry = "분노해"
    case upset = "속상해"
    case depressed = "우울해"
    case bored = "심심해"
    case flustered = "당황해"
    case teary = "눈물나"
}


struct Emotion {
    let emotionTitle: String
    var emotionCount: Int
    
    init(title: String, count: Int) {
        self.emotionTitle = title
        self.emotionCount = count
    }
    
    mutating func increasingCount() {
        emotionCount += 1
    }
    
    mutating func resetCount() {
        emotionCount = 0
    }
}
