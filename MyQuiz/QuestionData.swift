//
//  QuestionData.swift
//  MyQuiz
//
//  Created by 稲垣悠一 on 2016/08/16.
//  Copyright © 2016年 稲垣悠一. All rights reserved.
//

import Foundation

class QuestionData {

    var question: String?
    var answers: [String?]
    var correctAnswerNumber: Int
    
    var userChoiceAnswerNumber: Int?
    var questionNo: Int = 0
    
    init(questionSourceDataArray: [String]) {
        question = questionSourceDataArray[0]
        answers = questionSourceDataArray[1..<(1 + 4)].map({ $0 })
        correctAnswerNumber = Int(questionSourceDataArray[5])! - 1
    }
    
    func isCorrect() -> Bool {
        if userChoiceAnswerNumber == correctAnswerNumber {
            return true
        }
        return false
    }
    
}
